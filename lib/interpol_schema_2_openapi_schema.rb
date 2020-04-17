require "interpol_schema_2_openapi_schema/version"
require "interpol_schema/parser"
require "openapi_schema/builder"

module InterpolSchema2OpenapiSchema
  class Error < StandardError; end

  def self.execute(path)
    # debug
    schema = InterpolSchema::Parser.new(path)
    OpenapiSchema::Builder.new(schema)
  end
end
