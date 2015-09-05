require 'pastel'
require 'evernote_link_extractor/version'
require 'evernote_link_extractor/helper'
require 'evernote_link_extractor/file_list'
require 'evernote_link_extractor/link_list'
require 'evernote_link_extractor/csv_builder'
require 'evernote_link_extractor/runner'


# Main Module
module EvernoteLinkExtractor

  # run the whole job
  def self.run
    Runner.new.run
  end
end
