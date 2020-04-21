require "interpol_schema_2_openapi_schema/version"
require "interpol_schema/parser"
require "openapi_schema/path_object/builder"

module InterpolSchema2OpenapiSchema
  class Error < StandardError; end

  def self.execute(path)
    # debug
    schema = InterpolSchema::Parser.new(path)
    OpenapiSchema::PathObject::Builder.new(schema)
  end
end
