module EvernoteLinkExtractor
  class LinkList

    attr_reader :link_list, :file_list
    attr_accessor :failures

    def initialize
      @link_list  = []
      @failures   = 0
    end

    def create(file_list)
      @file_list = file_list
      create_link_list
    end

    private

    def create_link_list
      link_list = file_list.map do |file|
        h = {}
        f = File.open(file, 'r')
        next if File.directory?(f)
        link_and_title_from_file(f)
      end
      @link_list = link_list.compact
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
  end
end
