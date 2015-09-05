require 'spec_helper'

describe EvernoteLinkExtractor do
  it 'has a version number' do
    expect(EvernoteLinkExtractor::VERSION).not_to be nil
  end

  it 'has method run' do
    expect(EvernoteLinkExtractor.respond_to?(:run)).to be_truthy
  end
end
