require "evernote_link_extractor/version"
require "evernote_link_extractor/csv"

module EvernoteLinkExtractor
  def self.run
    EvernoteLinkExtractor::Csv.new
  end
end
