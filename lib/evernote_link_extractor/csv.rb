require 'pathname'
require 'nokogiri'
require 'csv'

module EvernoteLinkExtractor
  class Csv
    attr_reader :user_home, :directory, :file_list, :link_list

    def initialize
      @user_home = ENV['HOME']
      @directory = ''
      @file_list = []
      @link_list = []
      @failures  = 0
    end

    def run
      print 'Do you want to create a CSV file now (yes|no)?: '
      action = gets.chomp

      case action
      when 'no'
        close
      when 'yes'
        puts 'Starting to create the CSV file ...'
        execute
      else
        print 'please type yes or no: '
        run
      end
    end

    private

    def execute
      directory_to_scan
      scan_folder
      check_if_files_exist
      create_link_list
      create_csv
      show_summary
    end

    def directory_to_scan
      print 'What is the path to your .enex directory? (e.g.: ~/Documents/my_evernote.enex): '
      @directory = full_path_to_directory(gets.chomp)

      if does_directory_exist?
        @directory = Pathname.new([@directory, '**/*'].join('/'))
      else
        puts 'The directory does not exist ...'
        exit?
        directory_to_scan
      end
    end

    def scan_folder
      puts "scanning #{directory} ...\n"

      Dir.glob(directory).each do |filename|
        next if File.directory?(filename)
        next unless File.fnmatch('**.html', filename)
        @file_list << filename
      end
    end

    def check_if_files_exist
      return unless file_list.empty?
      puts "There are no files in the directory ..."
      exit?
      directory_to_scan
    end

    def create_link_list
      link_list = file_list.map do |file|
        h = {}
        f = File.open(file, 'r')
        next if File.directory?(f)
        link_and_title_from_file(f)
      end
      @link_list = link_list.compact
    end

    def create_csv
      csv_headers = %W(title link)
      CSV.open("evernote_link_export_#{Time.now.to_i}.csv", 'w', :write_headers=> true, :headers => csv_headers) do |csv|
        link_list.each do |link|
          csv << [link[:title], link[:href]]
        end
      end
    end

    # helper

    def exit?
      print 'Exit? (yes|no): '
      close if gets.chomp == 'yes'
    end

    def close
      puts 'Closing. Have a nice day.'
      exit(0)
    end

    def does_directory_exist?
      File.directory?(directory)
    end

    def full_path_to_directory(directory)
      directory.gsub(/~/, user_home)
    end

    def link_and_title_from_file(file)
      a_attr = extract_a_attribute(parse_html(file))
      if a_attr.nil?
        @failures += 1
        return
      end
      {
        title:  a_attr[:title],
        href:   a_attr[:href]
      }
    end

    def extract_a_attribute(html_body)
      html_body.css('a').first
    end

    def parse_html(file)
      html = file.readlines
      ::Nokogiri::HTML.parse(html[2])
    end

    def show_summary
      puts "   +++ Summary +++"
      puts "files found in directory: #{file_list.length}"
      puts "extracted links: #{link_list.length}"
      puts "failures: #{@failures}"
    end
  end
end
