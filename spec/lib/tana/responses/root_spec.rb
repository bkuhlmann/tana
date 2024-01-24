# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tana::Responses::Root do
  subject(:response) { described_class }

  describe "#call" do
    let :max_children do
      {
        children: [
          {
            nodeId: "One",
            type: "node",
            children: [
              {
                nodeId: "Two",
                type: "node",
                children: [
                  {
                    nodeId: "Three",
                    type: "node",
                    children: [
                      {
                        nodeId: "Four",
                        type: "node",
                        children: [
                          {
                            nodeId: "Five",
                            type: "node",
                            children: [
                              {
                                nodeId: "Six",
                                type: "node",
                                children: [
                                  {
                                    nodeId: "Seven",
                                    type: "node",
                                    children: [
                                      {
                                        nodeId: "Eight",
                                        type: "node",
                                        children: [
                                          nodeId: "Nine",
                                          type: "node",
                                          children: [
                                            {
                                              nodeId: "Ten",
                                              type: "node"
                                            }
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

    it "answers success with maximum children" do
      payload = response.call(max_children).to_monad.success.to_h
      expect(payload).to eq(max_children)
    end
  end
end
