# frozen_string_literal: true

require "dry/schema"

module Tana
  module Requests
    # Validates the sixth level of an API request.
    LevelF = Dry::Schema.JSON parent: Node.schema do
      optional(:children).value(:array, min_size?: 1).each { hash LevelG }
    end
  end
end
