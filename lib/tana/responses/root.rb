# frozen_string_literal: true

require "dry/schema"

module Tana
  module Responses
    # Validates the root node of an API response.
    Root = Dry::Schema.JSON do
      optional(:children).value(:array, min_size?: 1).each { hash LevelA }
    end
  end
end
