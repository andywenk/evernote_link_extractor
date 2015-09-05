require 'spec_helper'

describe EvernoteLinkExtractor::Helper do
  it { expect(EvernoteLinkExtractor::Helper.respond_to?(:exit?)).to be_truthy }
  it { expect(EvernoteLinkExtractor::Helper.respond_to?(:close)).to be_truthy }
end
