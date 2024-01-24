# frozen_string_literal: true

require "dry-container"
require "http"

module Tana
  # Defines application dependencies.
  module Container
    extend Dry::Container::Mixin

    register(:configuration, memoize: true) { Configuration::Loader.new.call }
    register(:http) { HTTP }
    register(:client, memoize: true) { API::Client.new }
  end
end
