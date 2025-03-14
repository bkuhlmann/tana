# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tana::Endpoints::Add::Action do
  subject(:endpoint) { described_class.new client: }

  let(:client) { Tana::API::Client.new http: }

  describe "#call" do
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
                  "nodeId": "rZrx3T6rsKpX",
                  "type": "node"
                }
              ]
            }
          JSON
        end
      end
    end

    it "answers created node" do
      result = endpoint.call({nodes: [{name: "Test"}]})

      expect(result).to be_success(
        Tana::Models::Root[
          children: [
            Tana::Models::Node[id: "rZrx3T6rsKpX", name: "Test", type: "node"]
          ]
        ]
      )
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

      it "answers failure with invalid request" do
        result = endpoint.call({targetNodeId: "INBOX", nodes: [{type: "field"}]})

        expect(result.failure.parse).to eq(
          {
            "formErrors" => ["Invalid input"],
            "fieldErrors" => {}
          }
        )
      end
    end
  end
end
