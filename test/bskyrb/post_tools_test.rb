# typed: true
# frozen_string_literal: true

require "test_helper"

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

    def get_image_upload_metadata(image, _client)
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
