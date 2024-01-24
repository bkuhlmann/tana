# frozen_string_literal: true

require "dry/schema"

module Tana
  module Responses
    # Validates the seventh level of an API response.
    LevelG = Dry::Schema.JSON parent: Node do
      optional(:children).value(:array, min_size?: 1).each { hash LevelH }
    end
  end
end
