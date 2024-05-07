# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tana::Client do
  subject(:client) { described_class.new endpoint: }

  let(:endpoint) { instance_spy Tana::Endpoints::Add::Action }

  describe "#call" do
    it "sends add request" do
      client.add({targetNodeId: "INBOX", nodes: [{name: "Test"}]})
      expect(endpoint).to have_received(:call).with(targetNodeId: "INBOX", nodes: [{name: "Test"}])
    end

    it "fails with invalid token" do
      client = described_class.new { |config| config.token = "bogus" }
      failure = client.add({targetNodeId: "INBOX", nodes: [{name: "Test"}]}).failure

      expect(failure.status).to eq(400)
    end
  end
end
