# frozen_string_literal: true

require "dry/schema"

module Tana
  module Responses
    # Validates the first level of an API response.
    LevelA = Dry::Schema.JSON parent: Node do
      optional(:children).value(:array, min_size?: 1).each { hash LevelB }
    end
  end
end
