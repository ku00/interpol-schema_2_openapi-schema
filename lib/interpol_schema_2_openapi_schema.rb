require 'thor'

require "interpol_schema_2_openapi_schema/version"
require "interpol_schema/parser"
require "openapi_schema/path_object/builder"

module InterpolSchema2OpenapiSchema
  class Error < StandardError; end

  class Cli < Thor
    default_command :build_path_object

    desc "build_path_object YAML_FILE_PATH", "Build OpenAPI path object"
    def build_path_object(file_path)
      puts OpenapiSchema::PathObject::Builder.new(
        InterpolSchema::Parser.new(file_path)
      ).build
    end

    # To make build-command available in no calling itself
    ARGV.unshift(self.default_command) unless self.all_tasks.has_key?(ARGV[0]) || self.instance_variable_get(:@map).has_key?(ARGV[0])
  end
end
