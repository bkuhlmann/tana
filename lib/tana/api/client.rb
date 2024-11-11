# frozen_string_literal: true

require "dry/monads"

module Tana
  module API
    # A low-level API client for making basic HTTP requests.
    class Client
      include Dependencies[:configuration, :http]
      include Dry::Monads[:result]

      def post path, body = nil, **parameters
        call __method__, path, json: body, params: parameters
      end

      private

      def call method, path, **options
        http.auth("Bearer #{configuration.token}")
            .headers(accept: configuration.accept)
            .public_send(method, "#{configuration.url}/#{path}", options)
            .then { |response| response.status.success? ? Success(response) : Failure(response) }
      end
    end
  end
end
