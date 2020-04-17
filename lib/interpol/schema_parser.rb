require 'yaml'

module Interpol
  class SchemaParser
    attr_reader :schema

    def initialize(path)
      @schema = YAML.load_file path
    end

    def request_params_in_path
      schema.dig("definitions", 0, "path_params")
    end

    def request_params_in_query
      schema.dig("definitions", 0, "query_params")
    end

    # For OpenAPI v2
    def request_params_in_body
      schema.dig("definitions", 0, "query_params")
    end

    def response_params
      schema.dig("definitions", 1, "schema")
    end
  end
end