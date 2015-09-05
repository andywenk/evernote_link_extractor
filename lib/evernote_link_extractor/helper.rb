module EvernoteLinkExtractor
  # some helper methods
  class Helper
    class << self

      # exit the whole program?
      def exit?
        print 'Exit? (yes|no): '
        close if gets.chomp == 'yes'
      end

      # close the program
      def close
        puts 'Closing. Have a nice day.'
        exit(0)
      end
    end
  end
end
