require 'yaml'

module Interpol
  class SchemaParser
    attr_reader :schema

    def initialize(path)
      @schema = YAML.load_file path
    end

    def response_params
      { "schema" => schema.dig("definitions", 1, "schema") }
    end
  end
end