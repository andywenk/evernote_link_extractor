require 'spec_helper'

describe EvernoteLinkExtractor::LinkList do
  it { expect(EvernoteLinkExtractor::LinkList.new.respond_to?(:create)).to be_truthy }
end
