# frozen_string_literal: true
require "spec_helper"

RSpec.describe Lunanode do
  it "has a version number" do
    expect(Lunanode::VERSION).not_to be nil
  end
end
