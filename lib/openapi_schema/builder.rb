module OpenapiSchema
  class Builder
    attr_reader :base_schema

    def initialize(base_schema)
      @base_schema = base_schema
    end

    def openapi_schema_template
      {
        "#{base_schema.http_method.downcase}" => {
          "summary" => "summary",
          "description" => "description",
          "parameters" => request_params,
          "responses" => {
            "#{base_schema.response_code}" => {
              "description" => "response description",
              "schema" => base_schema.response_params
            }
          }
        }
      }
    end

    def request_params
      [
        request_params_in_body,
      ].compact
    end

    def request_params_in_body
      return if base_schema.request_params_in_body === {}

      {
        "in" => "body",
        "schema" => base_schema.request_params_in_body
      }
    end
  end
end