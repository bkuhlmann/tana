# frozen_string_literal: true

require "dry/schema"

module Tana
  module Responses
    # Validates the fourth level of an API response.
    LevelD = Dry::Schema.JSON parent: Node do
      optional(:children).value(:array, min_size?: 1).each { hash LevelE }
    end
  end
end
