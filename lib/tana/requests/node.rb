# frozen_string_literal: true

require "dry/validation"
require "refinements/array"

module Tana
  module Requests
    # Validates a generic node within an API request.
    class Node < Dry::Validation::Contract
      TYPES = %w[boolean date field file plain reference url].freeze

      using Refinements::Array

      def initialize(types: TYPES, **)
        @types = types
        super(**)
      end

      json do
        optional(:attributeId).filled :string
        optional(:contentType).filled :string
        optional(:dataType).filled :string
        optional(:description).filled :string
        optional(:file).filled :string
        optional(:filename).filled :string
        optional(:id).filled :string
        optional(:name).filled :string
        optional(:supertags).array(:hash) { required(:id).filled :string }
        optional(:type).filled :string
        optional(:value).filled :bool
      end

      rule :type do
        key.failure "is invalid. Use: #{types.to_usage :or}" if key? && !types.include?(value)
      end

      rule :dataType do
        key.failure "is invalid. Use: #{types.to_usage :or}" if key? && !types.include?(value)
      end

      private

      attr_reader :types
    end
  end
end
