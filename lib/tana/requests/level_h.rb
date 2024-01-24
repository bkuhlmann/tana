# frozen_string_literal: true

require "dry/schema"

module Tana
  module Requests
    # Validates the eight level of an API request.
    LevelH = Dry::Schema.JSON parent: Node.schema do
      optional(:children).value(:array, min_size?: 1).each { hash LevelI }
    end
  end
end
