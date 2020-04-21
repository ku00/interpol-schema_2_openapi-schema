require 'yaml'

module OpenapiSchema
  module PathObject
    class Builder
      attr_reader :interpol_schema

      def initialize(interpol_schema)
        @interpol_schema = interpol_schema
      end

      def build
        base_template.to_yaml
      end

      def base_template
        {
          "#{interpol_schema.http_method.downcase}" => {
            "summary" => "summary",
            "description" => "description",
            "parameters" => request_params,
            "responses" => {
              "#{interpol_schema.response_code}" => {
                "description" => "response description",
                "schema" => interpol_schema.response_params
              }
            }
          }
        }
      end

      def request_params
        [
          request_params_in_path_template,
          request_params_in_query_template,
        ].flatten.compact
      end

      def request_params_in_path_template
        return if empty_param?(interpol_schema.request_params_in_path)

        interpol_schema.request_params_in_path["properties"].map do |name, detail|
          {
            "in" => "path",
            "name" => name,
            "type" => detail["type"],
            "required" => true,
          }.merge(
            enum_params_template(detail)
          )
        end
      end

      def request_params_in_query_template
        return if empty_param?(interpol_schema.request_params_in_query)

        interpol_schema.request_params_in_query["properties"].map do |name, detail|
          {
            "in" => "query",
            "name" => name,
            "type" => detail["type"],
          }.merge(enum_params_template(detail))
            .merge(required_param_template(detail))
        end
      end

      def enum_params_template(target)
        return {} if target["enum"].nil?

        {
          "enum" => target["enum"],
        }
      end

      def required_param_template(target)
        return {} if target["optional"].nil? || target["optional"] === true

        {
          "required" => true
        }
      end

      def empty_param?(target)
        target.nil? || target === {}
      end
    end
  end
end