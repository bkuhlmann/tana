# frozen_string_literal: true

module Tana
  # The primary interface for making API requests.
  class Client
    include Dependencies[:configuration]

    def initialize(endpoint: Endpoints::Add::Action.new, **)
      @endpoint = endpoint
      super(**)
      yield configuration if block_given?
    end

    def add(...) = endpoint.call(...)

    private

    attr_reader :endpoint
  end
end
