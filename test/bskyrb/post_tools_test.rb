# typed: true
# frozen_string_literal: true

require "test_helper"
require "stringio"

module Bskyrb
  # Test harness that includes PostTools with a stubbed resolve_handle
  class PostToolsTestHarness
    include ATProto::RequestUtils
    include PostTools

    attr_accessor :pds
    attr_reader :uploaded_images

    def initialize(pds: "https://bsky.social")
      @pds = pds
      @uploaded_images = []
    end

    # Stub resolve_handle to avoid network calls
    def resolve_handle(_pds, username)
      {"did" => "did:plc:fake#{username.delete(".")}"}
    end

    def create_test_image_embed(embed_images)
      create_image_embed(embed_images, self)
    end

    def create_test_external_embed(embed_url)
      create_external_embed(embed_url, self)
    end

    attr_accessor :fail_uploads

    def get_image_upload_metadata(image, _client)
      raise Errno::ENOENT, image.to_s if fail_uploads
      @uploaded_images << image
      {
        "image" => {
          "$type" => "blob",
          "ref" => {"$link" => "fake-image-#{@uploaded_images.length}"},
          "mimeType" => "image/jpeg",
          "size" => 1234
        },
        "aspectRatio" => {
          "width" => @uploaded_images.length,
          "height" => 1
        }
      }
    end
  end

  class PostToolsRemoteImageTestHarness
    include PostTools

    attr_reader :uploaded_body, :uploaded_path

    # Every host resolves to a public address so the SSRF check passes.
    def resolve_remote_addresses(_host, _port)
      ["93.184.216.34"]
    end

    def download_test_image(url)
      uri = Addressable::URI.parse(url).normalize
      download_and_upload_image_with_metadata(uri, self)
    end

    def upload_image_with_metadata(file, _client)
      @uploaded_path = file.path
      @uploaded_body = File.binread(file.path)
      {"image" => {"ref" => {"$link" => "fake-image"}}}
    end

    def read_test_response(chunks, max_bytes, destination)
      response = Struct.new(:chunks) do
        def [](_header)
          nil
        end

        def read_body
          chunks.each { |chunk| yield chunk }
        end
      end.new(chunks)

      read_remote_body(response, max_bytes, remote_deadline) { |chunk| destination.write(chunk) }
      destination
    end
  end

  class ExternalEmbedTestHarness < PostToolsTestHarness
    def upload_image_with_metadata(file, _client)
      raise Errno::ENOENT, file.path if fail_uploads

      @uploaded_images << File.binread(file.path)
      {
        "image" => {
          "$type" => "blob",
          "ref" => {"$link" => "fake-remote-image-#{@uploaded_images.length}"},
          "mimeType" => "image/jpeg",
          "size" => File.size(file.path)
        },
        "aspectRatio" => {"width" => 1, "height" => 1}
      }
    end
  end

  class PostToolsImageEmbedTest < Minitest::Test
    def setup
      @harness = PostToolsTestHarness.new
    end

    def test_streamio_ffmpeg_is_loaded_for_standalone_video_aspect_ratio
      assert defined?(FFMPEG)
    end

    def test_uses_images_embed_for_four_photos
      images = (1..4).map { |n| "image#{n}.jpg" }

      embed = @harness.create_test_image_embed(images)

      assert_equal "app.bsky.embed.images", embed["$type"]
      assert_equal 4, embed["images"].length
      assert_nil embed["images"][0]["$type"]
      assert_equal images, @harness.uploaded_images
    end

    def test_uses_gallery_embed_for_five_photos
      images = (1..5).map { |n| "image#{n}.jpg" }

      embed = @harness.create_test_image_embed(images)

      assert_equal "app.bsky.embed.gallery", embed["$type"]
      assert_equal 5, embed["items"].length
      assert_equal "app.bsky.embed.gallery#image", embed["items"][0]["$type"]
      assert_equal({"width" => 1, "height" => 1}, embed["items"][0]["aspectRatio"])
      assert_equal images, @harness.uploaded_images
    end

    def test_limits_gallery_embed_to_ten_photos
      images = (1..11).map { |n| "image#{n}.jpg" }

      embed = @harness.create_test_image_embed(images)

      assert_equal "app.bsky.embed.gallery", embed["$type"]
      assert_equal 10, embed["items"].length
      assert_equal images.first(10), @harness.uploaded_images
    end

    def test_preserves_alt_text_for_gallery_images
      images = (1..5).map do |n|
        {"url" => "image#{n}.jpg", "alt" => "Alt text #{n}"}
      end

      embed = @harness.create_test_image_embed(images)

      assert_equal "Alt text 5", embed["items"][4]["alt"]
    end

    def test_configures_image_processor_resource_limits
      PostTools::IMAGE_MAGICK_RESOURCE_LIMITS.each do |name, limit|
        assert_equal limit, ENV.fetch(name)
      end
    end
  end

  class PostToolsRemoteImageTest < Minitest::Test
    def setup
      @harness = PostToolsRemoteImageTestHarness.new
    end

    def test_downloads_supported_image_within_limit
      url = "https://cdn.example.com/photo.png"
      stub_request(:get, url).to_return(
        status: 200,
        body: "bounded image",
        headers: {"Content-Type" => "image/png"}
      )

      result = @harness.download_test_image(url)

      assert result["image"]
      assert_equal "bounded image", @harness.uploaded_body
      refute File.exist?(@harness.uploaded_path)
    end

    def test_rejects_image_declared_over_download_limit
      url = "https://cdn.example.com/oversized.png"
      stub_request(:get, url).to_return(
        status: 200,
        body: "",
        headers: {
          "Content-Type" => "image/png",
          "Content-Length" => (PostTools::REMOTE_IMAGE_MAX_BYTES + 1).to_s
        }
      )

      assert_nil @harness.download_test_image(url)
      assert_nil @harness.uploaded_body
    end

    def test_stops_before_writing_chunk_over_limit
      destination = StringIO.new

      assert_raises(PostTools::RemoteResourceTooLarge) do
        @harness.read_test_response(["1234", "5"], 4, destination)
      end
      assert_equal "1234", destination.string
    end

    def test_rejects_non_image_response
      url = "https://cdn.example.com/not-an-image.png"
      stub_request(:get, url).to_return(
        status: 200,
        body: "not an image",
        headers: {"Content-Type" => "text/plain"}
      )

      assert_nil @harness.download_test_image(url)
      assert_nil @harness.uploaded_body
    end
  end

  class PostToolsHashtagTest < Minitest::Test
    def setup
      @harness = PostToolsTestHarness.new
    end

    def test_detects_simple_hashtag
      facets = @harness.find_automatic_facets("Hello #world")
      tag_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal 1, tag_facets.length
      assert_equal "world", tag_facets[0]["features"][0]["tag"]
    end

    def test_detects_multiple_hashtags
      facets = @harness.find_automatic_facets("Hello #world and #ruby")
      tag_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal 2, tag_facets.length
      assert_equal "world", tag_facets[0]["features"][0]["tag"]
      assert_equal "ruby", tag_facets[1]["features"][0]["tag"]
    end

    def test_rejects_numeric_only_hashtags
      facets = @harness.find_automatic_facets("Issue #123 is fixed")
      tag_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal 0, tag_facets.length
    end

    def test_allows_hashtags_with_numbers_and_letters
      facets = @harness.find_automatic_facets("Check #issue123")
      tag_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal 1, tag_facets.length
      assert_equal "issue123", tag_facets[0]["features"][0]["tag"]
    end

    def test_allows_hashtags_starting_with_numbers_if_letters_present
      facets = @harness.find_automatic_facets("Check #2cool4school")
      tag_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal 1, tag_facets.length
      assert_equal "2cool4school", tag_facets[0]["features"][0]["tag"]
    end

    def test_hashtag_at_start_of_text
      facets = @harness.find_automatic_facets("#hello world")
      tag_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal 1, tag_facets.length
      assert_equal "hello", tag_facets[0]["features"][0]["tag"]
    end

    def test_detects_double_hash_tag
      facets = @harness.find_automatic_facets("##hello world")
      tag_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal 1, tag_facets.length
      assert_equal "#hello", tag_facets[0]["features"][0]["tag"]
    end

    def test_hashtag_with_underscores
      facets = @harness.find_automatic_facets("#hello_world")
      tag_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal 1, tag_facets.length
      assert_equal "hello_world", tag_facets[0]["features"][0]["tag"]
    end

    def test_hashtag_byte_positions_ascii
      text = "Hello #world"
      facets = @harness.find_automatic_facets(text)
      tag_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal 6, tag_facets[0]["index"]["byteStart"]
      assert_equal 12, tag_facets[0]["index"]["byteEnd"]
    end

    def test_hashtag_byte_positions_with_unicode
      # Emoji is multi-byte, so byte positions should differ from char positions
      text = "\u{1F600} #hello"
      facets = @harness.find_automatic_facets(text)
      tag_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal 1, tag_facets.length
      # The emoji U+1F600 is 4 bytes in UTF-8, plus space = 5 bytes
      assert_equal 5, tag_facets[0]["index"]["byteStart"]
      assert_equal 11, tag_facets[0]["index"]["byteEnd"]
    end

    def test_hashtag_strips_trailing_punctuation
      facets = @harness.find_automatic_facets("strips trailing #punctuation, #like. #this!")
      tag_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal ["punctuation", "like", "this"], tag_facets.map { |f| f["features"][0]["tag"] }
      assert_equal [
        {"byteStart" => 16, "byteEnd" => 28},
        {"byteStart" => 30, "byteEnd" => 35},
        {"byteStart" => 37, "byteEnd" => 42}
      ], tag_facets.map { |f| f["index"] }
    end

    def test_hashtag_strips_multiple_trailing_punctuation_marks
      facets = @harness.find_automatic_facets("strips #multi_trailing___...")
      tag_facet = facets.find { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal "multi_trailing", tag_facet["features"][0]["tag"]
      assert_equal 7, tag_facet["index"]["byteStart"]
      assert_equal 22, tag_facet["index"]["byteEnd"]
    end

    def test_hashtag_allows_internal_punctuation
      facets = @harness.find_automatic_facets("works #with,punctuation")
      tag_facet = facets.find { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal "with,punctuation", tag_facet["features"][0]["tag"]
      assert_equal 6, tag_facet["index"]["byteStart"]
      assert_equal 23, tag_facet["index"]["byteEnd"]
    end

    def test_detects_emoji_hashtag
      facets = @harness.find_automatic_facets("works with #🦋 emoji")
      tag_facet = facets.find { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal "🦋", tag_facet["features"][0]["tag"]
      assert_equal 11, tag_facet["index"]["byteStart"]
      assert_equal 16, tag_facet["index"]["byteEnd"]
    end

    def test_detects_fullwidth_hash
      facets = @harness.find_automatic_facets("match full width number sign: ＃tag")
      tag_facet = facets.find { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal "tag", tag_facet["features"][0]["tag"]
      assert_equal 30, tag_facet["index"]["byteStart"]
      assert_equal 36, tag_facet["index"]["byteEnd"]
    end

    def test_rejects_hashtags_over_sixty_four_graphemes
      facets = @harness.find_automatic_facets("body #thisisa65characterstring_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab")
      tag_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_empty tag_facets
    end
  end

  class PostToolsCashtagTest < Minitest::Test
    def setup
      @harness = PostToolsTestHarness.new
    end

    def test_detects_cashtag
      facets = @harness.find_automatic_facets("Buy $aapl now")
      tag_facet = facets.find { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal "$AAPL", tag_facet["features"][0]["tag"]
      assert_equal 4, tag_facet["index"]["byteStart"]
      assert_equal 9, tag_facet["index"]["byteEnd"]
    end

    def test_detects_parenthesized_cashtag
      facets = @harness.find_automatic_facets("Buy ($GOOG)")
      tag_facet = facets.find { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal "$GOOG", tag_facet["features"][0]["tag"]
      assert_equal 5, tag_facet["index"]["byteStart"]
      assert_equal 10, tag_facet["index"]["byteEnd"]
    end

    def test_rejects_numeric_and_long_cashtags
      facets = @harness.find_automatic_facets("$100 $ABC123 $TOOLONG")
      tag_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_empty tag_facets
    end
  end

  class PostToolsLinkTest < Minitest::Test
    def setup
      @harness = PostToolsTestHarness.new
    end

    # Regression test: public_suffix reads its suffix list with the locale
    # encoding, which raised Encoding::CompatibilityError under C/POSIX locales
    # until bskyrb started preloading the list as UTF-8. Runs in a subprocess
    # because the default external encoding is fixed at process boot.
    def test_link_detection_works_under_posix_locale
      script = 'require "bskyrb"; require "atproto/requests"; ' \
        "h = Class.new { include ATProto::RequestUtils; include Bskyrb::PostTools }.new; " \
        'exit(h.send(:valid_facet_domain?, "example.com") ? 0 : 1)'
      output = IO.popen(
        {"LANG" => nil, "LC_ALL" => "C", "RUBYOPT" => "-Ilib"},
        [RbConfig.ruby, "-e", script],
        err: [:child, :out],
        chdir: File.expand_path("../..", __dir__),
        &:read
      )

      assert $?.success?, "expected valid_facet_domain? to succeed under LC_ALL=C, got: #{output}"
    end

    def test_detects_https_link
      facets = @harness.find_automatic_facets("Visit https://example.com today")
      link_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#link" }

      assert_equal 1, link_facets.length
      assert_equal "https://example.com", link_facets[0]["features"][0]["uri"]
    end

    def test_detects_http_link
      facets = @harness.find_automatic_facets("Visit http://example.com today")
      link_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#link" }

      assert_equal 1, link_facets.length
      assert link_facets[0]["features"][0]["uri"].start_with?("http://example.com")
    end

    def test_detects_link_with_path
      facets = @harness.find_automatic_facets("Check https://example.com/path/to/page")
      link_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#link" }

      assert_equal 1, link_facets.length
      assert link_facets[0]["features"][0]["uri"].start_with?("https://example.com/path/to/page")
    end

    def test_link_byte_positions
      text = "Go to https://example.com now"
      facets = @harness.find_automatic_facets(text)
      link_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#link" }

      assert_equal 6, link_facets[0]["index"]["byteStart"]
      assert_equal 25, link_facets[0]["index"]["byteEnd"]
    end

    def test_link_excludes_trailing_sentence_period
      facets = @harness.find_automatic_facets("Visit https://example.com.")
      link_facet = facets.find { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#link" }

      assert_equal "https://example.com", link_facet["features"][0]["uri"]
      assert_equal 6, link_facet["index"]["byteStart"]
      assert_equal 25, link_facet["index"]["byteEnd"]
    end

    def test_detects_bare_domain_link
      facets = @harness.find_automatic_facets("Visit example.com today")
      link_facet = facets.find { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#link" }

      assert_equal "https://example.com", link_facet["features"][0]["uri"]
      assert_equal 6, link_facet["index"]["byteStart"]
      assert_equal 17, link_facet["index"]["byteEnd"]
    end

    def test_detects_bare_domain_with_path_query_and_fragment
      facets = @harness.find_automatic_facets("Visit example.com/path?x=1#top now")
      link_facet = facets.find { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#link" }

      assert_equal "https://example.com/path?x=1#top", link_facet["features"][0]["uri"]
      assert_equal 6, link_facet["index"]["byteStart"]
      assert_equal 30, link_facet["index"]["byteEnd"]
    end

    def test_link_excludes_trailing_comma_after_query
      facets = @harness.find_automatic_facets("Open https://example.com/path?x=1&y=2, then continue")
      link_facet = facets.find { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#link" }

      assert_equal "https://example.com/path?x=1&y=2", link_facet["features"][0]["uri"]
      assert_equal 5, link_facet["index"]["byteStart"]
      assert_equal 37, link_facet["index"]["byteEnd"]
    end

    def test_link_excludes_unmatched_trailing_parenthesis
      facets = @harness.find_automatic_facets("Open (https://example.com)")
      link_facet = facets.find { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#link" }

      assert_equal "https://example.com", link_facet["features"][0]["uri"]
      assert_equal 6, link_facet["index"]["byteStart"]
      assert_equal 25, link_facet["index"]["byteEnd"]
    end

    def test_link_keeps_matched_trailing_parenthesis
      facets = @harness.find_automatic_facets("Open https://example.com/thing_(cool)")
      link_facet = facets.find { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#link" }

      assert_equal "https://example.com/thing_(cool)", link_facet["features"][0]["uri"]
      assert_equal 5, link_facet["index"]["byteStart"]
      assert_equal 37, link_facet["index"]["byteEnd"]
    end

    def test_rejects_common_non_link_file_extensions
      facets = @harness.find_automatic_facets("Images website.com.jpg and something-cool.jpg")
      link_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#link" }

      assert_empty link_facets
    end

    def test_rejects_common_non_link_file_extension_paths
      facets = @harness.find_automatic_facets("Skip e.g./foo and website.com.jpg/foo")
      link_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#link" }

      assert_empty link_facets
    end

    def test_bare_link_excludes_trailing_colon
      facets = @harness.find_automatic_facets("a trailing bsky.app: colon")
      link_facet = facets.find { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#link" }

      assert_equal "https://bsky.app", link_facet["features"][0]["uri"]
      assert_equal 11, link_facet["index"]["byteStart"]
      assert_equal 19, link_facet["index"]["byteEnd"]
    end

    def test_does_not_create_hashtag_inside_link_fragment
      facets = @harness.find_automatic_facets("Visit https://example.com/path#section")
      tag_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_empty tag_facets
    end
  end

  class PostToolsMentionTest < Minitest::Test
    def setup
      @harness = PostToolsTestHarness.new
    end

    def test_detects_mention
      facets = @harness.find_automatic_facets("Hello @user.bsky.social")
      mention_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#mention" }

      assert_equal 1, mention_facets.length
      assert_equal "did:plc:fakeuserbskysocial", mention_facets[0]["features"][0]["did"]
    end

    def test_mention_byte_positions_exclude_leading_space
      facets = @harness.find_automatic_facets("Hello @user.bsky.social")
      mention_facet = facets.find { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#mention" }

      assert_equal 6, mention_facet["index"]["byteStart"]
      assert_equal 23, mention_facet["index"]["byteEnd"]
    end

    def test_detects_mention_after_parenthesis
      facets = @harness.find_automatic_facets("(cc @user.bsky.social)")
      mention_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#mention" }

      assert_equal 1, mention_facets.length
    end

    def test_mention_byte_positions_exclude_leading_parenthesis
      facets = @harness.find_automatic_facets("(cc @user.bsky.social)")
      mention_facet = facets.find { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#mention" }

      assert_equal 4, mention_facet["index"]["byteStart"]
      assert_equal 21, mention_facet["index"]["byteEnd"]
    end
  end

  class PostToolsOverlapTest < Minitest::Test
    def setup
      @harness = PostToolsTestHarness.new
    end

    def test_overlapping_facets
      facet1 = {"index" => {"byteStart" => 0, "byteEnd" => 10}}
      facet2 = {"index" => {"byteStart" => 5, "byteEnd" => 15}}

      assert @harness.facets_overlap?(facet1, facet2)
    end

    def test_non_overlapping_facets
      facet1 = {"index" => {"byteStart" => 0, "byteEnd" => 5}}
      facet2 = {"index" => {"byteStart" => 5, "byteEnd" => 10}}

      refute @harness.facets_overlap?(facet1, facet2)
    end

    def test_contained_facets
      facet1 = {"index" => {"byteStart" => 0, "byteEnd" => 20}}
      facet2 = {"index" => {"byteStart" => 5, "byteEnd" => 10}}

      assert @harness.facets_overlap?(facet1, facet2)
    end

    def test_has_conflict_with_conflict
      facet = {"index" => {"byteStart" => 5, "byteEnd" => 15}}
      list = [{"index" => {"byteStart" => 0, "byteEnd" => 10}}]

      assert @harness.has_conflict?(facet, list)
    end

    def test_has_conflict_without_conflict
      facet = {"index" => {"byteStart" => 10, "byteEnd" => 15}}
      list = [{"index" => {"byteStart" => 0, "byteEnd" => 5}}]

      refute @harness.has_conflict?(facet, list)
    end
  end

  class PostToolsManualFacetTest < Minitest::Test
    def setup
      @harness = PostToolsTestHarness.new
    end

    def test_manual_facets_take_priority_over_automatic
      text = "Check out click here for info"
      manual = @harness.create_link_facet(text, "click here", "https://example.com")

      facets = @harness.create_facets(text, manual_facets: [manual])

      assert_equal 1, facets.length
      assert_equal "app.bsky.richtext.facet#link", facets[0]["features"][0]["$type"]
      assert_equal "https://example.com", facets[0]["features"][0]["uri"]
    end

    def test_manual_shortened_bare_domain_link_takes_priority_over_automatic
      text = "Visit ticketmaster.com #music"
      long_url = "https://www.ticketmaster.com/event/2D0062F0B9159486?brand=carolinahurricanes"
      manual = @harness.create_link_facet(text, "ticketmaster.com", long_url)

      facets = @harness.create_facets(text, manual_facets: [manual])
      link_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#link" }
      tag_facets = facets.select { |f| f["features"][0]["$type"] == "app.bsky.richtext.facet#tag" }

      assert_equal 1, link_facets.length
      assert_equal long_url, link_facets[0]["features"][0]["uri"]
      assert_equal 1, tag_facets.length
      assert_equal "music", tag_facets[0]["features"][0]["tag"]
    end

    def test_manual_link_facet_auto_position
      text = "Click here for more"
      facet = @harness.create_link_facet(text, "here", "https://example.com")

      assert_equal 6, facet["index"]["byteStart"]
      assert_equal 10, facet["index"]["byteEnd"]
      assert_equal "https://example.com", facet["features"][0]["uri"]
    end

    def test_manual_link_facet_explicit_position
      text = "Click here for more"
      facet = @harness.create_link_facet(text, "here", "https://example.com", 6)

      assert_equal 6, facet["index"]["byteStart"]
      assert_equal 10, facet["index"]["byteEnd"]
    end

    def test_manual_link_facet_returns_nil_when_not_found
      text = "Click here for more"
      facet = @harness.create_link_facet(text, "missing", "https://example.com")

      assert_nil facet
    end

    def test_manual_hashtag_facet
      text = "Check out #ruby today"
      facet = @harness.create_hashtag_facet(text, "#ruby", "ruby")

      assert_equal 10, facet["index"]["byteStart"]
      assert_equal 15, facet["index"]["byteEnd"]
      assert_equal "ruby", facet["features"][0]["tag"]
    end

    def test_manual_mention_facet
      text = "Hello @someone today"
      facet = @harness.create_mention_facet(text, "@someone", "did:plc:abc123")

      assert_equal 6, facet["index"]["byteStart"]
      assert_equal 14, facet["index"]["byteEnd"]
      assert_equal "did:plc:abc123", facet["features"][0]["did"]
    end

    def test_non_conflicting_auto_and_manual_facets_coexist
      text = "Hello #world and click here"
      manual = @harness.create_link_facet(text, "click here", "https://example.com")

      facets = @harness.create_facets(text, manual_facets: [manual])

      assert_equal 2, facets.length
      types = facets.map { |f| f["features"][0]["$type"] }.sort
      assert_includes types, "app.bsky.richtext.facet#link"
      assert_includes types, "app.bsky.richtext.facet#tag"
    end
  end

  class PostToolsValidationTest < Minitest::Test
    def setup
      @harness = PostToolsTestHarness.new
    end

    def test_validates_valid_link_facet
      facets = [
        {
          "index" => {"byteStart" => 0, "byteEnd" => 10},
          "features" => [{"$type" => "app.bsky.richtext.facet#link", "uri" => "https://example.com"}]
        }
      ]

      result = @harness.validate_facets(facets)
      assert_equal 1, result.length
    end

    def test_rejects_link_facet_without_uri
      facets = [
        {
          "index" => {"byteStart" => 0, "byteEnd" => 10},
          "features" => [{"$type" => "app.bsky.richtext.facet#link", "uri" => ""}]
        }
      ]

      result = @harness.validate_facets(facets)
      assert_equal 0, result.length
    end

    def test_rejects_link_facet_with_non_http_uri
      facets = [
        {
          "index" => {"byteStart" => 0, "byteEnd" => 10},
          "features" => [{"$type" => "app.bsky.richtext.facet#link", "uri" => "ftp://example.com"}]
        }
      ]

      result = @harness.validate_facets(facets)
      assert_equal 0, result.length
    end

    def test_validates_valid_tag_facet
      facets = [
        {
          "index" => {"byteStart" => 0, "byteEnd" => 5},
          "features" => [{"$type" => "app.bsky.richtext.facet#tag", "tag" => "hello"}]
        }
      ]

      result = @harness.validate_facets(facets)
      assert_equal 1, result.length
    end

    def test_rejects_empty_tag
      facets = [
        {
          "index" => {"byteStart" => 0, "byteEnd" => 5},
          "features" => [{"$type" => "app.bsky.richtext.facet#tag", "tag" => ""}]
        }
      ]

      result = @harness.validate_facets(facets)
      assert_equal 0, result.length
    end

    def test_validates_valid_mention_facet
      facets = [
        {
          "index" => {"byteStart" => 0, "byteEnd" => 10},
          "features" => [{"$type" => "app.bsky.richtext.facet#mention", "did" => "did:plc:abc123"}]
        }
      ]

      result = @harness.validate_facets(facets)
      assert_equal 1, result.length
    end

    def test_rejects_empty_did
      facets = [
        {
          "index" => {"byteStart" => 0, "byteEnd" => 10},
          "features" => [{"$type" => "app.bsky.richtext.facet#mention", "did" => ""}]
        }
      ]

      result = @harness.validate_facets(facets)
      assert_equal 0, result.length
    end

    def test_rejects_empty_features
      facets = [
        {"index" => {"byteStart" => 0, "byteEnd" => 10}, "features" => []}
      ]

      result = @harness.validate_facets(facets)
      assert_equal 0, result.length
    end

    def test_rejects_unknown_feature_type
      facets = [
        {
          "index" => {"byteStart" => 0, "byteEnd" => 10},
          "features" => [{"$type" => "app.bsky.richtext.facet#unknown", "value" => "test"}]
        }
      ]

      result = @harness.validate_facets(facets)
      assert_equal 0, result.length
    end
  end
end

module Bskyrb
  class PostToolsExternalEmbedTest < Minitest::Test
    def setup
      @harness = ExternalEmbedTestHarness.new
    end

    def stub_page(url, og_image)
      html = "<html><head><meta property='og:title' content='A video'>" \
        "<meta property='og:description' content='desc'>" \
        "<meta property='og:image' content='#{og_image}'></head></html>"
      stub_request(:get, url).to_return(status: 200, body: html, headers: {"Content-Type" => "text/html"})
    end

    def stub_image(url)
      stub_request(:get, url).to_return(status: 200, body: "image bytes", headers: {"Content-Type" => "image/jpeg"})
    end

    # Temporarily replaces a method on one object. Stands in for Minitest's
    # Object#stub, which minitest 6 no longer loads by default.
    def with_method_override(object, name, implementation)
      object.define_singleton_method(name) { |*args| implementation.call(*args) }
      yield
    ensure
      object.singleton_class.send(:remove_method, name) if object.singleton_methods.include?(name)
    end

    def with_env(overrides)
      saved = overrides.keys.to_h { |key| [key, ENV[key]] }
      overrides.each { |key, value| ENV[key] = value }
      yield
    ensure
      saved&.each { |key, value| ENV[key] = value }
    end

    def with_dns(addresses_by_host = {})
      resolver = lambda do |host, _port|
        Array(addresses_by_host.fetch(host, "93.184.216.34"))
      end
      with_method_override(@harness, :resolve_remote_addresses, resolver) { yield }
    end

    def test_resolves_relative_og_image_against_the_page_url
      stub_page("https://piped.video/watch?v=abc", "/img/icons/favicon-32x32.png")
      stub_image("https://piped.video/img/icons/favicon-32x32.png")

      embed = with_dns { @harness.create_test_external_embed("https://piped.video/watch?v=abc") }

      assert_requested :get, "https://piped.video/img/icons/favicon-32x32.png"
      assert_equal ["image bytes"], @harness.uploaded_images
      assert_equal "A video", embed["external"]["title"]
      assert embed["external"]["thumb"]
    end

    def test_keeps_absolute_og_image_as_is
      stub_page("https://example.com/post", "https://cdn.example.com/pic.jpg")
      stub_image("https://cdn.example.com/pic.jpg")

      with_dns { @harness.create_test_external_embed("https://example.com/post") }

      assert_requested :get, "https://cdn.example.com/pic.jpg"
      assert_equal ["image bytes"], @harness.uploaded_images
    end

    def test_falls_back_to_minimal_card_when_page_returns_an_error_status
      stub_request(:get, "https://example.com/post").to_return(status: 403, body: "nope")

      embed = with_dns { @harness.create_test_external_embed("https://example.com/post") }

      assert_equal "app.bsky.embed.external", embed["$type"]
      assert_equal "https://example.com/post", embed["external"]["uri"]
      assert_equal "", embed["external"]["title"]
      assert_equal "", embed["external"]["description"]
      refute embed["external"].key?("thumb")
    end

    def test_falls_back_to_minimal_card_when_page_is_not_html
      stub_request(:get, "https://example.com/doc.pdf")
        .to_return(status: 200, body: "%PDF", headers: {"Content-Type" => "application/pdf"})

      embed = with_dns { @harness.create_test_external_embed("https://example.com/doc.pdf") }

      assert_equal "https://example.com/doc.pdf", embed["external"]["uri"]
      assert_equal "", embed["external"]["title"]
    end

    def test_falls_back_to_minimal_card_when_content_type_is_missing
      stub_request(:get, "https://example.com/post").to_return(status: 200, body: "<html></html>", headers: {})

      embed = with_dns { @harness.create_test_external_embed("https://example.com/post") }

      assert_equal "https://example.com/post", embed["external"]["uri"]
      assert_equal "", embed["external"]["title"]
    end

    def test_accepts_images_served_as_generic_binary
      stub_page("https://example.com/post", "https://bucket.s3.amazonaws.com/pic.jpg")
      stub_request(:get, "https://bucket.s3.amazonaws.com/pic.jpg")
        .to_return(status: 200, body: "image bytes", headers: {"Content-Type" => "binary/octet-stream"})

      embed = with_dns { @harness.create_test_external_embed("https://example.com/post") }

      assert_equal ["image bytes"], @harness.uploaded_images
      assert embed["external"]["thumb"]
    end

    def test_falls_through_to_the_next_address_when_one_is_unreachable
      uri = @harness.send(:normalize_remote_uri, "https://example.com/post")
      tried = []
      fake = Struct.new(:address, :tried) do
        def start
          tried << address
          raise Errno::ENETUNREACH if address.include?(":")
          self
        end
      end
      builder = ->(_uri, address) { fake.new(address, tried) }

      http = with_remote_fetch_proxy(nil) do
        with_method_override(@harness, :remote_http, builder) do
          @harness.send(:start_remote_http, uri, ["2606:2800:220:1::1", "93.184.216.34"])
        end
      end

      assert_equal ["2606:2800:220:1::1", "93.184.216.34"], tried
      assert_equal "93.184.216.34", http.address
    end

    def test_raises_remote_fetch_error_when_no_address_is_reachable
      uri = @harness.send(:normalize_remote_uri, "https://example.com/post")
      failing = Object.new
      def failing.start = raise(Errno::ECONNREFUSED)

      error = assert_raises(PostTools::RemoteFetchError) do
        with_remote_fetch_proxy(nil) do
          with_method_override(@harness, :remote_http, ->(_u, _a) { failing }) do
            @harness.send(:start_remote_http, uri, ["93.184.216.34", "93.184.216.35"])
          end
        end
      end
      assert_match(/Could not connect/, error.message)
    end

    def with_remote_fetch_proxy(value)
      saved = Bskyrb.remote_fetch_proxy
      Bskyrb.remote_fetch_proxy = value
      yield
    ensure
      Bskyrb.remote_fetch_proxy = saved
    end

    def test_ignores_environment_proxy_and_pins_the_address
      uri = @harness.send(:normalize_remote_uri, "https://example.com/post")

      http = with_env("https_proxy" => "http://proxy.internal:3128", "HTTPS_PROXY" => "http://proxy.internal:3128") do
        @harness.send(:remote_http, uri, "93.184.216.34")
      end

      refute http.proxy?
      assert_equal "93.184.216.34", http.ipaddr
    end

    def test_uses_an_explicitly_configured_proxy
      uri = @harness.send(:normalize_remote_uri, "https://example.com/post")

      http = with_remote_fetch_proxy("http://proxy.internal:3128") do
        @harness.send(:remote_http, uri, "93.184.216.34")
      end

      assert http.proxy?
      assert_equal "proxy.internal", http.proxy_address
      assert_equal 3128, http.proxy_port
      assert_nil http.ipaddr
    end

    def test_rejects_a_non_http_configured_proxy
      uri = @harness.send(:normalize_remote_uri, "https://example.com/post")

      assert_raises(PostTools::RemoteFetchError) do
        with_remote_fetch_proxy("socks5://proxy.internal:1080") do
          @harness.send(:remote_http, uri, "93.184.216.34")
        end
      end
    end

    def test_rejected_image_url_returns_nil_instead_of_raising
      metadata = @harness.send(
        :download_and_upload_image_with_metadata,
        Addressable::URI.parse("https://user:secret@images.example.com/a.png"),
        @harness
      )

      assert_nil metadata
      assert_empty @harness.uploaded_images
    end

    def test_missing_content_type_raises_remote_fetch_error
      response = Net::HTTPOK.new("1.1", "200", "OK")

      assert_raises(PostTools::RemoteFetchError) do
        @harness.send(:validate_remote_content_type!, response, PostTools::REMOTE_PAGE_CONTENT_TYPES)
      end
    end

    def test_still_raises_when_the_page_itself_is_non_public
      assert_raises(PostTools::BlockedRemoteAddressError) do
        with_dns("example.com" => "127.0.0.1") do
          @harness.create_test_external_embed("https://example.com/post")
        end
      end
      assert_not_requested :get, "https://example.com/post"
    end

    def test_omits_thumb_when_the_thumbnail_cannot_be_uploaded
      stub_page("https://example.com/post", "https://cdn.example.com/missing.jpg")
      stub_image("https://cdn.example.com/missing.jpg")
      @harness.fail_uploads = true

      embed = with_dns { @harness.create_test_external_embed("https://example.com/post") }

      assert_equal "app.bsky.embed.external", embed["$type"]
      assert_equal "https://example.com/post", embed["external"]["uri"]
      refute embed["external"].key?("thumb")
    end

    def test_rejects_non_public_ipv4_and_ipv6_destinations
      blocked_addresses = [
        "127.0.0.1",
        "10.0.0.1",
        "169.254.169.254",
        "::1",
        "fc00::1",
        "fe80::1"
      ]

      blocked_addresses.each do |address|
        error = assert_raises(PostTools::RemoteFetchError) do
          with_dns("example.com" => address) do
            @harness.send(
              :fetch_remote_resource,
              "https://example.com/post",
              expected_content_types: PostTools::REMOTE_PAGE_CONTENT_TYPES
            ) { raise "request must not be sent" }
          end
        end
        assert_match(/non-public/, error.message)
      end

      assert_not_requested :get, "https://example.com/post"
    end

    def test_rejects_mixed_public_and_private_dns_answers
      error = assert_raises(PostTools::RemoteFetchError) do
        with_dns("example.com" => ["93.184.216.34", "127.0.0.1"]) do
          @harness.send(
            :fetch_remote_resource,
            "https://example.com/post",
            expected_content_types: PostTools::REMOTE_PAGE_CONTENT_TYPES
          ) { raise "request must not be sent" }
        end
      end

      assert_match(/non-public/, error.message)
      assert_not_requested :get, "https://example.com/post"
    end

    def test_pins_the_validated_public_address
      uri = @harness.send(:normalize_remote_uri, "https://example.com/post")

      http = @harness.send(:remote_http, uri, "93.184.216.34")

      assert_equal "93.184.216.34", http.ipaddr
      assert_equal "example.com", http.address
    end

    def test_revalidates_a_redirect_before_following_it
      start_url = "https://example.com/redirect"
      private_url = "http://169.254.169.254/latest/meta-data/"
      stub_request(:get, start_url).to_return(status: 302, headers: {"Location" => private_url})

      assert_raises(PostTools::RemoteFetchError) do
        with_dns("example.com" => "93.184.216.34", "169.254.169.254" => "169.254.169.254") do
          @harness.create_test_external_embed(start_url)
        end
      end

      assert_not_requested :get, private_url
    end

    def test_omits_private_og_image_from_a_public_page
      page_url = "https://example.com/post"
      private_image_url = "http://10.0.0.8/secret.jpg"
      stub_page(page_url, private_image_url)

      embed = with_dns("example.com" => "93.184.216.34", "10.0.0.8" => "10.0.0.8") do
        @harness.create_test_external_embed(page_url)
      end

      refute embed["external"].key?("thumb")
      assert_not_requested :get, private_image_url
      assert_empty @harness.uploaded_images
    end

    def test_rejects_private_remote_image_before_upload
      metadata = with_dns("10.0.0.8" => "10.0.0.8") do
        @harness.send(
          :download_and_upload_image_with_metadata,
          Addressable::URI.parse("http://10.0.0.8/secret.jpg"),
          @harness
        )
      end

      assert_nil metadata
      assert_not_requested :get, "http://10.0.0.8/secret.jpg"
      assert_empty @harness.uploaded_images
    end

    def assert_minimal_card(embed, url)
      assert_equal "app.bsky.embed.external", embed["$type"]
      assert_equal url, embed["external"]["uri"]
      assert_equal "", embed["external"]["title"]
      assert_equal "", embed["external"]["description"]
      refute embed["external"].key?("thumb")
    end

    def test_falls_back_to_minimal_card_when_page_declares_an_oversized_length
      url = "https://example.com/oversized"
      stub_request(:get, url).to_return(
        status: 200,
        body: "",
        headers: {
          "Content-Type" => "text/html",
          "Content-Length" => (PostTools::REMOTE_PAGE_MAX_BYTES + 1).to_s
        }
      )

      assert_minimal_card(with_dns { @harness.create_test_external_embed(url) }, url)
      assert_empty @harness.uploaded_images
    end

    def test_follows_relative_redirect_for_html_page
      stub_request(:get, "https://example.com/redirect")
        .to_return(status: 302, headers: {"Location" => "/post"})
      stub_page("https://example.com/post", "https://cdn.example.com/pic.jpg")
      stub_image("https://cdn.example.com/pic.jpg")

      embed = with_dns { @harness.create_test_external_embed("https://example.com/redirect") }

      assert_equal "A video", embed["external"]["title"]
      assert_equal ["image bytes"], @harness.uploaded_images
    end

    def test_falls_back_to_minimal_card_when_the_connection_is_refused
      stub_request(:get, "https://example.com/post").to_raise(Errno::ECONNREFUSED)

      assert_minimal_card(with_dns { @harness.create_test_external_embed("https://example.com/post") }, "https://example.com/post")
    end

    def test_falls_back_to_minimal_card_on_tls_failure
      stub_request(:get, "https://example.com/post").to_raise(OpenSSL::SSL::SSLError.new("certificate has expired"))

      assert_minimal_card(with_dns { @harness.create_test_external_embed("https://example.com/post") }, "https://example.com/post")
    end

    def test_falls_back_to_minimal_card_on_timeout
      stub_request(:get, "https://example.com/post").to_timeout

      assert_minimal_card(with_dns { @harness.create_test_external_embed("https://example.com/post") }, "https://example.com/post")
    end

    def test_falls_back_to_minimal_card_when_the_page_is_too_large
      big = "<html><head><meta property='og:title' content='Big'></head>" + ("x" * (PostTools::REMOTE_PAGE_MAX_BYTES + 1))
      stub_request(:get, "https://example.com/huge").to_return(status: 200, body: big, headers: {"Content-Type" => "text/html"})

      assert_minimal_card(with_dns { @harness.create_test_external_embed("https://example.com/huge") }, "https://example.com/huge")
    end

    def test_follows_redirects_without_mixing_in_the_redirect_body
      stub_request(:get, "https://example.com/old")
        .to_return(status: 301, body: "<html><head><meta property='og:title' content='Moved'></head></html>",
          headers: {"Location" => "https://example.com/new"})
      stub_page("https://example.com/new", "")

      embed = with_dns { @harness.create_test_external_embed("https://example.com/old") }

      assert_equal "A video", embed["external"]["title"]
      assert_equal "https://example.com/old", embed["external"]["uri"]
    end

    def test_fetches_non_ascii_urls_and_keeps_the_original_in_the_card
      stub_page("https://de.wikipedia.org/wiki/K%C3%B6ln", "")

      embed = with_dns { @harness.create_test_external_embed("https://de.wikipedia.org/wiki/Köln") }

      assert_equal "A video", embed["external"]["title"]
      assert_equal "https://de.wikipedia.org/wiki/Köln", embed["external"]["uri"]
    end
  end

  class PostToolsRemoteImageDownloadTest < Minitest::Test
    class Harness
      include ATProto::RequestUtils
      include PostTools

      attr_reader :uploaded

      def initialize
        @uploaded = []
      end

      # Every host resolves to a public address so the SSRF check passes.
      def resolve_remote_addresses(_host, _port)
        ["93.184.216.34"]
      end

      def upload_image_with_metadata(file, _client)
        @uploaded << {extname: File.extname(file.path), bytes: File.binread(file.path)}
        {"image" => {"$type" => "blob"}, "aspectRatio" => {"width" => 1, "height" => 1}}
      end
    end

    def setup
      @harness = Harness.new
    end

    def download(url)
      @harness.send(:download_and_upload_image_with_metadata, Addressable::URI.parse(url), @harness)
    end

    def test_names_the_tempfile_from_the_response_content_type
      stub_request(:get, "https://site.example/og-image?id=42")
        .to_return(status: 200, body: "png bytes", headers: {"Content-Type" => "image/png"})

      assert download("https://site.example/og-image?id=42")
      assert_equal [{extname: ".png", bytes: "png bytes"}], @harness.uploaded
    end

    def test_falls_back_to_the_url_extension_for_non_image_types
      stub_request(:get, "https://bucket.example/photo.jpg")
        .to_return(status: 200, body: "jpg bytes", headers: {"Content-Type" => "binary/octet-stream"})

      assert download("https://bucket.example/photo.jpg")
      assert_equal ".jpg", @harness.uploaded.first[:extname]
    end

    def test_skips_images_over_the_size_limit
      stub_request(:get, "https://site.example/huge.jpg")
        .to_return(status: 200, body: "x" * (PostTools::REMOTE_IMAGE_MAX_BYTES + 1), headers: {"Content-Type" => "image/jpeg"})

      assert_nil download("https://site.example/huge.jpg")
      assert_empty @harness.uploaded
    end

    def test_skips_error_responses
      stub_request(:get, "https://site.example/missing.jpg")
        .to_return(status: 404, body: "not found", headers: {"Content-Type" => "text/html"})

      assert_nil download("https://site.example/missing.jpg")
      assert_empty @harness.uploaded
    end

    def test_skips_images_that_time_out
      stub_request(:get, "https://site.example/slow.jpg").to_timeout

      assert_nil download("https://site.example/slow.jpg")
      assert_empty @harness.uploaded
    end
  end
end
