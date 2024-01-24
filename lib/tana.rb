# frozen_string_literal: true

require "dry/monads"
require "dry/validation"
require "zeitwerk"

Dry::Schema.load_extensions :monads
Dry::Validation.load_extensions :monads

Zeitwerk::Loader.new.then do |loader|
  loader.inflector.inflect "api" => "API"
  loader.tag = File.basename __FILE__, ".rb"
  loader.push_dir __dir__
  loader.setup
end

# Main namespace.
module Tana
  def self.loader registry = Zeitwerk::Registry
    @loader ||= registry.loaders.find { |loader| loader.tag == File.basename(__FILE__, ".rb") }
  end
end
