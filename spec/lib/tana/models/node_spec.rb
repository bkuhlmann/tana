# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tana::Models::Node do
  subject :model do
    described_class[id: "100000000000", name: "Test", description: "A test.", type: "node"]
  end

  describe ".for" do
    it "answers record without children" do
      record = described_class.for nodeId: "100000000000", name: "Test", type: "node"
      expect(record).to eq(described_class[id: "100000000000", name: "Test", type: "node"])
    end

    it "answers record with children" do
      record = described_class.for nodeId: "100000000000",
                                   name: "Test",
                                   type: "node",
                                   children: [{nodeId: "200000000000", name: "Child", type: "node"}]

      expect(record).to eq(
        described_class[
          id: "100000000000",
          name: "Test",
          type: "node",
          children: [described_class[id: "200000000000", name: "Child", type: "node"]]
        ]
      )
    end
  end

  describe "#to_hash" do
    it "answers hash" do
      expect(model.to_hash).to eq(
        id: "100000000000", name: "Test", description: "A test.", type: "node", children: []
      )
    end
  end
end
