require "spec_helper"

describe Rack::Chunker::VERSION do
  it "should be a string" do
    expect(Rack::Chunker::VERSION).to be_kind_of(String)
  end
end
