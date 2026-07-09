# typed: false

require "json"
require "erb"
require "fileutils"

module Bskyrb
  module LexiconParser
    @@active_namespace = ""

    DEFAULT_LEXICON_SOURCE = "atproto"

    def self.def_is_query(defn)
      defn["defs"].has_key?("main") &&
        defn["defs"]["main"].has_key?("type") &&
        defn["defs"]["main"]["type"] == "query"
    end

    def self.def_is_subscription(defn)
      defn["defs"].has_key?("main") &&
        defn["defs"]["main"].has_key?("type") &&
        defn["defs"]["main"]["type"] == "subscription"
    end

    def self.def_is_procedure(defn)
      defn["defs"].has_key?("main") &&
        defn["defs"]["main"].has_key?("type") &&
        defn["defs"]["main"]["type"] == "procedure"
    end

    def self.build_classes_hash_from_lexicon_defs(lexicon_file)
      parsed = File.open(lexicon_file) { |f| JSON.parse(f.read) }
      output = {}
      # return if def_is_query(parsed) || def_is_procedure(parsed) || def_is_subscription(parsed)
      parsed["defs"].each do |k, v| # map {|v| build_class_hash_from_schema(v)}
        next if v["type"] == "main" # skip queries, procedures, etc.
        @@active_namespace = parsed["id"].split(".").map(&:capitalize).join("")
        next if k == "main"
        output[ref_to_class_str(k)] = if v["type"] == "record"
          build_class_hash_from_schema(v["record"]["properties"])
        else
          build_class_hash_from_schema(v)
        end
      end
      output
    end

    def self.build_queries_and_procedures_from_lexicon(lexicon_file)
      parsed = File.open(lexicon_file) { |f| JSON.parse(f.read) }
      output = {}
      return unless def_is_query(parsed) || def_is_procedure(parsed)
      parsed["defs"].each do |k, v| # map {|v| build_class_hash_from_schema(v)}
        next if k != "main" || v["type"] == "record" # skip basic defs
        next if v["type"] == "subscription" # some day
        @@active_namespace = parsed["id"].split(".").map(&:capitalize).join("")
        class_name = ref_to_class_str(parsed["id"].split(".").last)
        built_def = {}
        output[class_name] = {}
        if v["type"] == "query"
          built_def["input"] = build_class_hash_from_schema(v["parameters"])
          if v["output"] && v["output"]["schema"]
            built_def["output"] = build_class_hash_from_schema(v["output"]["schema"])
          end
        end
        if v["type"] == "procedure"
          if v["input"]
            built_def["input"] = build_class_hash_from_schema(v["input"]["schema"])
          end
          if v["output"] && v["output"]["schema"]
            built_def["output"] = build_class_hash_from_schema(v["output"]["schema"])
          end
        end
        output[class_name] = built_def unless built_def.empty?
      end
      output
    end

    def self.build_class_hash_from_schema(json_schema, output = {})
      return if json_schema.nil?
      return if json_schema.has_key? "main"
      to_process = json_schema["properties"] || json_schema
      to_process.each_pair do |key, value|
        if key == "type" || !value.is_a?(Hash) # || value["type"] == "query" || key == "main"
          next
        end

        output[key] = if value["type"] == "object"
          build_class_hash_from_schema(value, {})
        elsif value["type"] == "array"
          [build_class_hash_from_schema(value, {}).values.first]
        elsif value["type"] == "ref"
          ref_to_class_str(value["ref"])
        else
          -1
        end
      end
      output
    end

    def self.lexicon_files(source = DEFAULT_LEXICON_SOURCE)
      source = source.to_s
      lexicon_root = if File.directory?(File.join(source, "lexicons"))
        File.join(source, "lexicons")
      elsif File.basename(source) == "lexicons" && File.directory?(source)
        source
      else
        source
      end

      files = Dir[File.join(lexicon_root, "**/*.json")].sort
      raise ArgumentError, "No lexicon JSON files found under #{source}" if files.empty?

      files
    end

    def self.generated_source(lexicon_source = DEFAULT_LEXICON_SOURCE)
      basic_defs = {}
      lexicon_files(lexicon_source).each do |file|
        hashes = build_classes_hash_from_lexicon_defs(file)
        basic_defs = basic_defs.merge(hashes) unless hashes.empty?
      end

      input_output_defs = {}
      lexicon_files(lexicon_source).each do |file|
        hashes = build_queries_and_procedures_from_lexicon(file)
        input_output_defs = input_output_defs.merge(hashes) unless hashes.nil? || hashes.empty?
      end

      [
        "module Bskyrb",
        basic_class_definitions(basic_defs),
        input_output_class_definitions(input_output_defs),
        "end"
      ].join("\n")
    end

    def self.ref_to_class_str(ref, ns = @@active_namespace)
      klass_str_lower = ref.split("#")[-1]
      klass_str = klass_str_lower[0].capitalize + klass_str_lower.slice(1..)
      ns += "::" if ns
      "#{ns}#{klass_str}"
    end

    def self.basic_template
      %(
module <%= klass_str.split("::").first %>
class <%= klass_str.split("::").last %>
  <% properties.each do |key, value| %>
  attr_accessor :<%= key %>
  <% end %>

  def self.from_hash(hash)
    # httparty-returned string-keyed hash
    instance = new
    <% properties.each do |key, value| %>
    instance.send("<%= key %>=", hash["<%= key %>"])
    <% end %>
    instance
  end
end
end
)
    end

    def self.basic_class_definitions(classes_hash)
      classes_hash.map do |klass_str, properties|
        ERB.new(basic_template).result_with_hash({klass_str: klass_str, properties: properties})
      end
    end

    def self.input_output_template
      %(
module <%= klass_str.split("::").first %>
  module <%= klass_str.split("::").last %>
    <% ["input", "output"].each do |top_level_key| %>
    <% next unless properties.has_key?(top_level_key) && !properties[top_level_key].nil? %>
    class <%= top_level_key.capitalize %>
      <% properties[top_level_key].each do |key, value| %>
      attr_accessor :<%= key %>
      <% end %>

      def self.from_hash(hash)
        # httparty-returned string-keyed hash
        instance = new
          <% properties[top_level_key].each do |key, value| %>
        instance.send("<%= key %>=", hash["<%= key %>"])
          <% end %>
        instance
      end

      def to_h
        {
          <% properties[top_level_key].each do |key, value| %>
            "<%= key %>" => instance_variable_get(<%= ("@" + key).inspect %>),
          <% end %>
        }
      end
    end
    <% end %>
  end
end
)
    end

    def self.input_output_class_definitions(classes_hash)
      classes_hash.map do |klass_str, properties|
        ERB.new(input_output_template).result_with_hash({klass_str: klass_str, properties: properties})
      end
    end
  end

  class DynamicClassFromHash
    def self.from_hash(hash)
      hash.each do |klass_sym, properties|
        Object.const_set(klass_sym, Class.new do
          attr_accessor(*properties.keys.map(&:to_sym))

          def self.from_hash(properties)
            # httparty-returned string-keyed hash body
            instance = new
            properties.each do |key, value|
              instance.send("#{key}=", value)
            end
            instance
          end
        end)
      end
    end
  end
end

if __FILE__ == $0
  lexicon_source = ARGV[0] || ENV.fetch("BSKYRB_LEXICONS", Bskyrb::LexiconParser::DEFAULT_LEXICON_SOURCE)

  File.open("lib/bskyrb/generated_classes.rb", "w") do |f|
    f.puts Bskyrb::LexiconParser.generated_source(lexicon_source)
  end
  FileUtils.mkdir_p("tmp/rubocop_cache")
  abort "bin/format failed" unless system({"RUBOCOP_CACHE_ROOT" => File.expand_path("tmp/rubocop_cache")}, "bin/format")

  File.open("sig/generated_classes.rbs", "w") do |output|
    abort "rbs prototype failed" unless system("bundle", "exec", "rbs", "prototype", "rb", "lib/bskyrb/generated_classes.rb", out: output)
  end
end
