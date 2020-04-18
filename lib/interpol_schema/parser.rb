require 'yaml'

module InterpolSchema
  class Parser
    attr_reader :schema

    def initialize(path)
      @schema = YAML.load_file path
    end

    def http_method
      schema.dig("method")
    end

    def request_params_in_path
      schema.dig("definitions", 0, "path_params")
    end

    def request_params_in_query
      schema.dig("definitions", 0, "query_params")
    end

    def response_code
      schema.dig("definitions", 1, "status_codes", 0)
    end

    def response_params
      schema.dig("definitions", 1, "schema")
    end
  end
end