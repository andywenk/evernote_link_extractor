require 'spec_helper'

describe EvernoteLinkExtractor::FileList do
  it { expect(EvernoteLinkExtractor::FileList.new.respond_to?(:create)).to be_truthy }
end
