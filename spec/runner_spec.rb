require 'spec_helper'

describe EvernoteLinkExtractor::Runner do
  it { expect(EvernoteLinkExtractor::Runner.new.respond_to?(:run)).to be_truthy }
end
