# frozen_string_literal: true

require "dry/schema"

module Tana
  module Requests
    # Validates the fifth level of an API request.
    LevelE = Dry::Schema.JSON parent: Node.schema do
      optional(:children).value(:array, min_size?: 1).each { hash LevelF }
    end
  end
end
