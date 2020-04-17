require "interpol_schema_2_openapi_schema/version"
require "interpol/schema_parser"

module InterpolSchema2OpenapiSchema
  class Error < StandardError; end

  def self.execute(path)
    # debug
    Interpol::SchemaParser.new(path)
  end
end
