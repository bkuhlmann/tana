# frozen_string_literal: true

require "core"

module Tana
  module Models
    # A generic node.
    Node = Data.define :id, :name, :description, :type, :children do
      def self.for(**attributes) = new(**attributes.transform_keys!(nodeId: :id))

      def initialize id:, type:, name: nil, description: nil, children: Core::EMPTY_ARRAY
        updated_children = children.map { |child| self.class.for(**child) }
        super id:, name:, type:, description:, children: updated_children
      end

      alias_method :to_hash, :to_h
    end
  end
end
