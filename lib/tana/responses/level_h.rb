# frozen_string_literal: true

require "dry/schema"

module Tana
  module Responses
    # Validates the eighth level of an API response.
    LevelH = Dry::Schema.JSON parent: Node do
      optional(:children).value(:array, min_size?: 1).each { hash LevelI }
    end
  end
end
