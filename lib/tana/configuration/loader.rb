# frozen_string_literal: true

require "refinements/string"

module Tana
  module Configuration
    # Handles loading of configuration with environment defaults.
    class Loader
      using Refinements::String

      def initialize model = Content, environment: ENV
        @model = model
        @environment = environment
      end

      def call
        model[
          accept: environment.fetch("TANA_API_ACCEPT", "application/json"),
          token: environment["TANA_API_TOKEN"],
          url: environment.fetch("TANA_API_URL", "https://europe-west1-tagr-prod.cloudfunctions.net")
        ]
      end

      private

      attr_reader :model, :environment
    end
  end
end
