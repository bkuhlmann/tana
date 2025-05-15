# frozen_string_literal: true

require "inspectable"
require "pipeable"

module Tana
  module Endpoints
    module Add
      # Adds a node to the graph.
      class Action
        include Dependencies[:client]
        include Inspectable[request: :class, response: :class]
        include Pipeable

        # rubocop:todo Metrics/ParameterLists
        def initialize(
          request: Requests::Add.new,
          response: Responses::Root,
          model: Models::Root,
          **
        )
          @request = request
          @response = response
          @model = model
          super(**)
        end
        # rubocop:enable Metrics/ParameterLists

        def call(body, **)
          pipe body,
               validate(request),
               insert("addToNodeV2", at: 0),
               insert(**),
               to(client, :post),
               try(:parse, catch: JSON::ParserError),
               validate(response, as: :to_h),
               to(model, :for)
        end

        private

        attr_reader :request, :response, :model
      end
    end
  end
end
