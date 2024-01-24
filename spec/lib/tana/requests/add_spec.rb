# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tana::Requests::Add do
  subject(:request) { described_class.new }

  describe "#call" do
    let :max_children do
      {
        targetNodeId: "INBOX",
        nodes: [
          {
            name: "One",
            children: [
              {
                name: "Two",
                children: [
                  {
                    name: "Three",
                    children: [
                      {
                        name: "Four",
                        children: [
                          {
                            name: "Five",
                            children: [
                              {
                                name: "Six",
                                children: [
                                  {
                                    name: "Seven",
                                    children: [
                                      {
                                        name: "Eight",
                                        children: [
                                          name: "Nine",
                                          children: [
                                            {name: "Ten"}
                                          ]
                                        ]
                                      }
                                    ]
                                  }
                                ]
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      }
    end

    it "answers success with nodes for inbox" do
      payload = request.call({targetNodeId: "INBOX", nodes: [{name: "Child"}]})
                       .to_monad
                       .success
                       .to_h

      expect(payload).to eq({targetNodeId: "INBOX", nodes: [{name: "Child"}]})
    end

    it "answers success with nodes for schema" do
      payload = request.call({targetNodeId: "SCHEMA", nodes: [{name: "Child"}]})
                       .to_monad
                       .success
                       .to_h

      expect(payload).to eq({targetNodeId: "SCHEMA", nodes: [{name: "Child"}]})
    end

    it "answers success with maximum children" do
      payload = request.call(max_children).to_monad.success.to_h
      expect(payload).to eq(max_children)
    end

    it "answers success with nodes for specific node" do
      payload = request.call({targetNodeId: "vxF7bTqMLO8h", nodes: [{name: "Child"}]})
                       .to_monad
                       .success
                       .to_h

      expect(payload).to eq({targetNodeId: "vxF7bTqMLO8h", nodes: [{name: "Child"}]})
    end

    it "answers success with nodes without targets" do
      payload = request.call({nodes: [{name: "Child"}]}).to_monad.success.to_h
      expect(payload).to eq({nodes: [{name: "Child"}]})
    end

    it "answers failure with invalid target node ID" do
      errors = request.call({targetNodeId: "abc-123", name: "Test", nodes: [{name: "Child"}]})
                      .to_monad
                      .failure
                      .errors
                      .to_h

      expect(errors).to eq(
        targetNodeId: [%(is invalid. Use: "INBOX", "SCHEMA", or /\\A[0-9a-z\\-_]{12}\\Z/i)]
      )
    end

    it "answers failure with missing nodes" do
      errors = request.call({name: "Test", nodes: []}).to_monad.failure.errors.to_h
      expect(errors).to eq(nodes: ["size cannot be less than 1"])
    end
  end
end
