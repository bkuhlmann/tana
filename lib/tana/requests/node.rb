# frozen_string_literal: true

require "dry/validation"

module Tana
  module Requests
    # A request node.
    class Node < Dry::Validation::Contract
      json do
        optional(:dataType).filled :string
        required(:name).filled :string
        optional(:description).filled :string
        optional(:id).filled :string
        optional(:attributeId).filled :string
        optional(:supertags).filled(:array) { required(:id).filled :string }
        optional(:childen).array(self)
      end
    end
  end
end
