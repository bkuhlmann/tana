# frozen_string_literal: true

require "dry/schema"

module Tana
  module Responses
    # Validates the sixth level of an API response.
    LevelF = Dry::Schema.JSON parent: Node do
      optional(:children).value(:array, min_size?: 1).each { hash LevelG }
    end
  end
end
