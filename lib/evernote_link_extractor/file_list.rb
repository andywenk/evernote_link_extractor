module EvernoteLinkExtractor
  class FileList

    attr_reader :user_home, :directory, :file_list

    def initialize
      @user_home = ENV['HOME']
      @file_list = []
    end

    def create
      directory_to_scan
      scan_directory
      check_if_files_exist
      file_list
    end

    private

    # ask which directory has to be scanned
    def directory_to_scan
      print 'What is the path to your .enex directory? (e.g.: ~/Documents/my_evernote.enex): '
      @directory = full_path_to_directory(gets.chomp)

      if does_directory_exist?
        @directory = Pathname.new([@directory, '**/*'].join('/'))
      else
        puts 'The directory does not exist ...'
        Helper.exit?
        directory_to_scan
      end
    end

    def scan_directory
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
      Helper.exit?
      directory_to_scan
    end

    def does_directory_exist?
      File.directory?(directory)
    end

    def full_path_to_directory(directory)
      directory.gsub(/~/, user_home)
    end
  end
end
