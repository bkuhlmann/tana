# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tana::Configuration::Loader do
  subject(:loader) { described_class.new }

  describe "#call" do
    it "answers default configuration content" do
      expect(loader.call).to eq(
        Tana::Configuration::Content[
          accept: "application/json",
          token: ENV.fetch("TANA_API_TOKEN"),
          url: "https://europe-west1-tagr-prod.cloudfunctions.net"
        ]
      )
    end

    it "answers custom configuration content" do
      loader = described_class.new environment: {
        "TANA_API_ACCEPT" => "application/json",
        "TANA_API_TOKEN" => "ghp_abc",
        "TANA_API_URL" => "https://api.gh.com"
      }

      expect(loader.call).to eq(
        Tana::Configuration::Content[
          accept: "application/json",
          token: "ghp_abc",
          url: "https://api.gh.com"
        ]
      )
    end
  end
end
