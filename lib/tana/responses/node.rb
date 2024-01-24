# frozen_string_literal: true

require "dry/schema"

module Tana
  module Responses
    # Validates a generic node within an API response.
    Node = Dry::Schema.JSON do
      optional(:description).filled :string
      optional(:name).filled :string
      required(:nodeId).filled :string
      required(:type).filled :string
    end
  end
end
