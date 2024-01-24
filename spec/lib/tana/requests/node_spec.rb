# frozen_string_literal: true

require "spec_helper"

RSpec.describe Tana::Requests::Node do
  subject(:request) { described_class.new }

  describe "#call" do
    it "answers success with valid data type" do
      payload = request.call({name: "Test", dataType: "plain"}).to_monad.success.to_h
      expect(payload).to eq(name: "Test", dataType: "plain")
    end

    it "answers failure with invalid data type" do
      errors = request.call({name: "Test", dataType: "bogus"}).to_monad.failure.errors.to_h

      expect(errors).to eq(
        dataType: [
          %(is invalid. Use: "boolean", "date", "field", "file", "plain", "reference", or "url")
        ]
      )
    end

    it "answers success with valid type" do
      payload = request.call({name: "Test", type: "plain"}).to_monad.success.to_h
      expect(payload).to eq(name: "Test", type: "plain")
    end

    it "answers failure with invalid type" do
      errors = request.call({name: "Test", type: "bogus"}).to_monad.failure.errors.to_h

      expect(errors).to eq(
        type: [
          %(is invalid. Use: "boolean", "date", "field", "file", "plain", "reference", or "url")
        ]
      )
    end
  end
end
