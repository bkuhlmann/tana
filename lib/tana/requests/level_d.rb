# frozen_string_literal: true

require "dry/schema"

module Tana
  module Requests
    # Validates the fourth level of an API request.
    LevelD = Dry::Schema.JSON parent: Node.schema do
      optional(:children).value(:array, min_size?: 1).each { hash LevelE }
    end
  end
end
