module EvernoteLinkExtractor
  # some helper methods
  class Helper
    class << self

      # exit the whole program?
      def exit?
        print question('Exit? (yes|no): ')
        close if gets.chomp == 'yes'
      end

      # close the program
      def close
        message("\nClosing. Have a nice day!\n")
        exit(0)
      end

      def question(q)
        print pastel.yellow.bold(q)
      end

      def warning(w)
        question(w)
      end

      def message(m)
        print pastel.green(m)
      end

      def headline(h)
        print pastel.white.on_cyan.bold(h)
      end

      def pastel
        Pastel.new
      end
    end
  end
end
