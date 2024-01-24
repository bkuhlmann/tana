# frozen_string_literal: true

require "dry/schema"

module Tana
  module Requests
    # Validates the seventh level of an API request.
    LevelG = Dry::Schema.JSON parent: Node.schema do
      optional(:children).value(:array, min_size?: 1).each { hash LevelH }
    end
  end
end
