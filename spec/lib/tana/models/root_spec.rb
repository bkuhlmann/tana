# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tana::Models::Root do
  subject(:model) { described_class.new }

  describe ".for" do
    let :body do
      {
        children: [
          {nodeId: "abc123def456", name: "Test", type: "node"}
        ]
      }
    end

    it "answers record" do
      record = described_class.for(**body)

      expect(record).to eq(
        described_class[
          children: [
            Tana::Models::Node[id: "abc123def456", name: "Test", type: "node"]
          ]
        ]
      )
    end
  end
end
