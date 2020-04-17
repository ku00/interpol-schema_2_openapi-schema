require "interpol_schema_2_openapi_schema/version"
require "interpol/schema_parser"
require "openapi/schema_builder"

module InterpolSchema2OpenapiSchema
  class Error < StandardError; end

  def self.execute(path)
    # debug
    schema = Interpol::SchemaParser.new(path)
    Openapi::SchemaBuilder.new(schema)
  end
end
