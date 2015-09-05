require "evernote_link_extractor/version"
require "evernote_link_extractor/csv"

module EvernoteLinkExtractor
  def self.run
    Csv.new.run
  end
end
