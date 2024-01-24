# frozen_string_literal: true

require "dry/schema"

module Tana
  module Requests
    # Validates the second level of an API request.
    LevelB = Dry::Schema.JSON parent: Node.schema do
      optional(:children).value(:array, min_size?: 1).each { hash LevelC }
    end
  end
end
