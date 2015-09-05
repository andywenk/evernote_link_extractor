require 'spec_helper'

describe EvernoteLinkExtractor::CsvBuilder do
  it { expect(EvernoteLinkExtractor::CsvBuilder.respond_to?(:create)).to be_truthy }
end
