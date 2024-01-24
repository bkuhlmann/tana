# frozen_string_literal: true

require "dry/schema"

module Tana
  module Requests
    # Validates the first level of an API request.
    LevelA = Dry::Schema.JSON parent: Node.schema do
      optional(:children).value(:array, min_size?: 1).each { hash LevelB }
    end
  end
end
