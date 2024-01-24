# frozen_string_literal: true

require "dry/schema"

module Tana
  module Requests
    # Validates the ninth level of an API request.
    LevelI = Dry::Schema.JSON parent: Node.schema do
      optional(:children).value(:array, min_size?: 1).each { hash Node.schema }
    end
  end
end
