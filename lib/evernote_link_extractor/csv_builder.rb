module EvernoteLinkExtractor
  class CsvBuilder

    def self.create(link_list)
      CSV.open("evernote_link_export_#{Time.now.to_i}.csv", 'w', :write_headers=> true, :headers => csv_headers) do |csv|
        csv << rows(link_list)
      end
    end

    private

    def self.csv_headers
      %W(title link)
    end

    def self.rows(link_list)
      link_list.map do |link|
        [link[:title], link[:href]]
      end
    end
  end
end
