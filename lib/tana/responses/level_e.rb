# frozen_string_literal: true

require "dry/schema"

module Tana
  module Responses
    # Validates the fifth level of an API response.
    LevelE = Dry::Schema.JSON parent: Node do
      optional(:children).value(:array, min_size?: 1).each { hash LevelF }
    end
  end
end
