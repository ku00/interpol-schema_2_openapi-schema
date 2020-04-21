# InterpolSchema2OpenapiSchema

This gem provides the CLI to convert [Interpol](https://github.com/seomoz/interpol) endpoint definition to [OpenAPI](https://github.com/OAI/OpenAPI-Specification) definition.

## Supported OpenAPI Version

- OpenAPI 2.0

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'interpol_schema_2_openapi_schema'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install interpol_schema_2_openapi_schema

## Usage

### Convert to Path Objects

Give an endpoint definition yaml.

```
$ istos ./path/to/index.yaml

# dump to stdout
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/interpol_schema_2_openapi_schema.

