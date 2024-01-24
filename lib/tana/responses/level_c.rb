# frozen_string_literal: true

require "dry/schema"

module Tana
  module Responses
    # Validates the third level of an API response.
    LevelC = Dry::Schema.JSON parent: Node do
      optional(:children).value(:array, min_size?: 1).each { hash LevelD }
    end
  end
end
