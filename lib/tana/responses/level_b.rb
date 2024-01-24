# frozen_string_literal: true

require "dry/schema"

module Tana
  module Responses
    # Validates the second level of an API response.
    LevelB = Dry::Schema.JSON parent: Node do
      optional(:children).value(:array, min_size?: 1).each { hash LevelC }
    end
  end
end
