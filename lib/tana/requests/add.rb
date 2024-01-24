# frozen_string_literal: true

require "dry/validation"
require "refinements/array"

module Tana
  module Requests
    # Validates an API add request.
    class Add < Dry::Validation::Contract
      using Refinements::Array

      TARGETS = ["INBOX", "SCHEMA", /\A[0-9a-z\-_]{12}\Z/i].freeze

      def initialize(targets: TARGETS, **)
        @targets = targets
        super(**)
      end

      json do
        optional(:targetNodeId).filled :string
        required(:nodes).value(:array, min_size?: 1).each { hash LevelA }
      end

      rule :targetNodeId do
        next unless key? && targets.none? { |target| value.match? target }

        key.failure "is invalid. Use: #{targets.to_usage :or}"
      end

      private

      attr_reader :targets
    end
  end
end
