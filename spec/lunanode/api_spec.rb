# frozen_string_literal: true
require "spec_helper"

RSpec.describe Lunanode::API do
  let(:api) { described_class.new(api_id: "", api_key: "") }

  it "initializes by keyword arguments" do
    expect(api).to be_a described_class
  end

  context "actions" do
    it "raises an APIError on authentication failure" do
      expect { api.vm_list }.to raise_error(
        Lunanode::APIError,
        "authentication failure; common reasons: bad nonce (computer time " \
        "off), source IP mismatch, invalid API id/key"
      )
    end
  end
end
