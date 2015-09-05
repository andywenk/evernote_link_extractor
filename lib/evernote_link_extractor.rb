require "evernote_link_extractor/version"
require "evernote_link_extractor/runner"

# Main Module
module EvernoteLinkExtractor

  # run the whole job
  def self.run
    Runner.new.run
  end
end
