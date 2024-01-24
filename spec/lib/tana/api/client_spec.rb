# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tana::API::Client do
  subject(:client) { described_class.new http: }

  describe "#post" do
    context "with success" do
      let :http do
        HTTP::Fake::Client.new do
          post "/addToNodeV2" do
            headers["Content-Type"] = "application/json"
            status 200

            <<~JSON
              {
                "children": [
                  {
                    "name": "Test",
                    "description": "A test.",
                    "nodeId": "rZrx3T6rsKpX",
                    "type": "node"
                  }
                ]
              }
            JSON
          end
        end
      end

      it "answers body" do
        result = client.post "addToNodeV2",
                             {
                               nodes: [{name: "Test", description: "A test."}],
                               targetNodeId: "INBOX"
                             }

        expect(result.success.parse).to match(
          "children" => [
            {
              "name" => "Test",
              "description" => "A test.",
              "nodeId" => kind_of(String),
              "type" => "node"
            }
          ]
        )
      end
    end

    context "with failure" do
      let :http do
        HTTP::Fake::Client.new do
          post "/addToNodeV2" do
            headers["Content-Type"] = "application/json"
            status 422

            <<~JSON
              {
                "formErrors": [
                  "Invalid input"
                ],
                "fieldErrors": {}
              }
            JSON
          end
        end
      end

      it "answers error" do
        result = client.post "addToNodeV2", {targetNodeId: "INBOX"}

        expect(result.failure.parse).to include(
          "formErrors" => ["Invalid input"],
          "fieldErrors" => {}
        )
      end
    end
  end
end
