# frozen_string_literal: true

require "core"

module Tana
  module Models
    # A root node.
    Root = Data.define :children do
      def self.for(node: Node, **attributes)
        attributes.fetch(:children, Core::EMPTY_ARRAY)
                  .map { |child| node.for(**child) }
                  .then { |children| new children: }
      end
    end
  end
end
