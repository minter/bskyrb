# typed: true
# frozen_string_literal: true

require "test_helper"
require "bskyrb/codegen"
require "fileutils"
require "tmpdir"

module Bskyrb
  class CodegenTest < Minitest::Test
    def test_lexicon_files_accepts_checkout_root
      Dir.mktmpdir do |dir|
        lexicon_dir = File.join(dir, "lexicons", "app", "bsky", "feed")
        FileUtils.mkdir_p(lexicon_dir)
        File.write(File.join(lexicon_dir, "defs.json"), "{}")

        files = LexiconParser.lexicon_files(dir)

        assert_equal [File.join(lexicon_dir, "defs.json")], files
      end
    end

    def test_generated_source_includes_current_feed_fields
      Dir.mktmpdir do |dir|
        write_lexicon(dir, "app/bsky/feed/defs.json", {
          "lexicon" => 1,
          "id" => "app.bsky.feed.defs",
          "defs" => {
            "postView" => {
              "type" => "object",
              "properties" => {
                "uri" => {"type" => "string"},
                "bookmarkCount" => {"type" => "integer"},
                "quoteCount" => {"type" => "integer"},
                "threadgate" => {"type" => "ref", "ref" => "#threadgateView"},
                "debug" => {"type" => "unknown"}
              }
            },
            "viewerState" => {
              "type" => "object",
              "properties" => {
                "like" => {"type" => "string"},
                "bookmarked" => {"type" => "boolean"}
              }
            },
            "feedViewPost" => {
              "type" => "object",
              "properties" => {
                "post" => {"type" => "ref", "ref" => "#postView"},
                "feedContext" => {"type" => "string"}
              }
            },
            "threadgateView" => {
              "type" => "object",
              "properties" => {
                "uri" => {"type" => "string"}
              }
            }
          }
        })

        source = LexiconParser.generated_source(dir)

        assert_includes source, "attr_accessor :bookmarkCount"
        assert_includes source, "attr_accessor :quoteCount"
        assert_includes source, "attr_accessor :threadgate"
        assert_includes source, "attr_accessor :bookmarked"
        assert_includes source, "attr_accessor :feedContext"
      end
    end

    def test_generated_source_includes_current_video_classes
      Dir.mktmpdir do |dir|
        write_lexicon(dir, "app/bsky/video/defs.json", {
          "lexicon" => 1,
          "id" => "app.bsky.video.defs",
          "defs" => {
            "jobStatus" => {
              "type" => "object",
              "properties" => {
                "jobId" => {"type" => "string"},
                "state" => {"type" => "string"},
                "blob" => {"type" => "blob"},
                "error" => {"type" => "string"},
                "message" => {"type" => "string"}
              }
            }
          }
        })
        write_lexicon(dir, "app/bsky/video/getUploadLimits.json", {
          "lexicon" => 1,
          "id" => "app.bsky.video.getUploadLimits",
          "defs" => {
            "main" => {
              "type" => "query",
              "output" => {
                "schema" => {
                  "type" => "object",
                  "properties" => {
                    "canUpload" => {"type" => "boolean"},
                    "remainingDailyVideos" => {"type" => "integer"}
                  }
                }
              }
            }
          }
        })

        source = LexiconParser.generated_source(dir)

        assert_includes source, "module AppBskyVideoDefs"
        assert_includes source, "class JobStatus"
        assert_includes source, "module AppBskyVideoGetuploadlimits"
        assert_includes source, "attr_accessor :canUpload"
        assert_includes source, "attr_accessor :remainingDailyVideos"
      end
    end

    def test_generated_source_rejects_unsafe_constant_names
      unsafe_lexicons = [
        {
          "lexicon" => 1,
          "id" => "app.bsky.feed.defs\nend\nKernel.system(\"id payload\")",
          "defs" => {"postView" => object_with_property("uri")}
        },
        {
          "lexicon" => 1,
          "id" => "app.bsky.feed.defs",
          "defs" => {"postView\nend\nKernel.system(\"definition payload\")" => object_with_property("uri")}
        }
      ]

      unsafe_lexicons.each do |lexicon|
        Dir.mktmpdir do |dir|
          write_lexicon(dir, "app/bsky/feed/defs.json", lexicon)

          error = assert_raises(ArgumentError) { LexiconParser.generated_source(dir) }

          assert_match(/cannot be represented as a Ruby constant/, error.message)
        end
      end
    end

    def test_generated_source_rejects_unsafe_names_in_query_lexicons
      payload = "\nend\nKernel.system(\"query payload\")"
      lexicons = [
        {"lexicon" => 1, "id" => "app.bsky.feed.getThing#{payload}",
         "defs" => {"main" => {"type" => "query", "parameters" => object_with_property("uri")}}},
        {"lexicon" => 1, "id" => "app.bsky.feed.getThing",
         "defs" => {"main" => {"type" => "query", "parameters" => object_with_property("bad#{payload}")}}}
      ]

      lexicons.each do |lexicon|
        Dir.mktmpdir do |dir|
          write_lexicon(dir, "app/bsky/feed/getThing.json", lexicon)

          assert_raises(ArgumentError) { LexiconParser.generated_source(dir) }
        end
      end
    end

    def test_generated_constant_parts_requires_two_valid_segments
      assert_equal %w[AppBskyFeedDefs PostView], LexiconParser.generated_constant_parts("AppBskyFeedDefs::PostView")

      ["PostView", "A::B::C", "app::PostView", "A::", "A::B-C", "A::B\nend"].each do |name|
        assert_raises(ArgumentError, name) { LexiconParser.generated_constant_parts(name) }
      end
    end

    def test_generated_source_rejects_property_names_that_are_not_ruby_identifiers
      ["name\nend\nKernel.system(\"property payload\")", "foo-bar", "$type", "foo?", "1abc"].each do |property_name|
        [
          {"postView" => object_with_property(property_name)},
          {"main" => {"type" => "query", "parameters" => object_with_property(property_name)}}
        ].each do |defs|
          Dir.mktmpdir do |dir|
            write_lexicon(dir, "app/bsky/feed/defs.json", {"lexicon" => 1, "id" => "app.bsky.feed.defs", "defs" => defs})

            error = assert_raises(ArgumentError, property_name) { LexiconParser.generated_source(dir) }
            assert_match(/cannot be represented as a Ruby attribute/, error.message)
          end
        end
      end
    end

    def test_generated_source_with_valid_properties_is_safe_to_eval
      Dir.mktmpdir do |dir|
        write_lexicon(dir, "app/bsky/feed/defs.json", {
          "lexicon" => 1,
          "id" => "app.bsky.feed.defs",
          "defs" => {
            "postView" => object_with_property("displayName"),
            "main" => {"type" => "query", "parameters" => object_with_property("displayName")}
          }
        })

        source = LexiconParser.generated_source(dir)

        assert_includes source, "attr_accessor :displayName"
        assert_includes source, 'instance.send("displayName=", hash["displayName"])'
        assert_includes source, '"displayName" => instance_variable_get("@displayName")'
        assert_nothing_raised_syntax(source)
      end
    end

    private

    def assert_nothing_raised_syntax(source)
      assert RubyVM::InstructionSequence.compile(source)
    end

    def object_with_property(property_name)
      {
        "type" => "object",
        "properties" => {property_name => {"type" => "string"}}
      }
    end

    def write_lexicon(root, relative_path, body)
      path = File.join(root, "lexicons", relative_path)
      FileUtils.mkdir_p(File.dirname(path))
      File.write(path, JSON.pretty_generate(body))
    end
  end
end
