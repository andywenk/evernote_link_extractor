require 'pathname'
require 'nokogiri'
require 'csv'

module EvernoteLinkExtractor

  # This is the main class and is doing the whole job ... atm
  class Runner
    attr_reader :file_list, :link_list

    # initializer with setting up some instance variables
    def initialize
      @file_list = []
      @link_list = []
      @fl = FileList.new
      @ll = LinkList.new
    end

    # this is the only public method to be called
    def run
      Helper.question('Do you want to create a CSV file now (yes|no)?: ')
      action = gets.chomp

      case action
      when 'no'
        Helper.close
      when 'yes'
        execute
      else
        Helper.warning('please type yes or no: ')
        run
      end
    end

    private

    # execute all the needed steps
    def execute
      @file_list = @fl.create
      @link_list = @ll.create(file_list)
      CsvBuilder.create(link_list)
      show_summary
    end

    def show_summary

summary = <<SUMMARY
\nfiles found in directory: #{file_list.length}
extracted links:          #{link_list.length}
failures:                 #{@ll.failures}

SUMMARY
      puts
      Helper.headline("          +++ Summary +++           ")
      Helper.message(summary)
    end
  end
end
