# frozen_string_literal: true

require "dry/schema"

module Tana
  module Responses
    # Validates the ninth level of an API response.
    LevelI = Dry::Schema.JSON parent: Node do
      optional(:children).value(:array, min_size?: 1).each { hash Node }
    end
  end
end
