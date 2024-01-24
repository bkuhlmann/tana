# frozen_string_literal: true

require "dry/schema"

module Tana
  module Requests
    # Validates the third level of an API request.
    LevelC = Dry::Schema.JSON parent: Node.schema do
      optional(:children).value(:array, min_size?: 1).each { hash LevelD }
    end
  end
end
