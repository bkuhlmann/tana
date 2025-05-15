# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tana::Configuration::Content do
  subject :content do
    described_class[accept: "application/json", token: "secret", url: "http://tana.test.io"]
  end

  describe "#inspect" do
    it "answers redacted token" do
      expect(content.inspect).to eq(
        %(#<struct Tana::Configuration::Content accept="application/json", ) +
        %(token="[REDACTED]", url="http://tana.test.io">)
      )
    end
  end
end
