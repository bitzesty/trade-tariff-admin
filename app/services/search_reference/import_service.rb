require 'csv'

class SearchReference
  class ImportService
    class << self
      def from_csv!(csv_file)
        CSV.foreach(csv_file.path, headers: true) do |row|
          new(row).import!
        end
      end
    end

    def initialize(row)
      @row = row
      @search_reference = get_search_reference
    end

    def import!
      @search_reference.assign_attributes(
        title: @row["title"]
      )
      @search_reference.save
    end

    private

    def get_search_reference
      referenced_resource.search_references.build(
        referenced_id: referenced_resource.id
      )
    end

    def referenced_resource
      referenced_class.find(
        @row["referenced_id"]
      )
    end

    def referenced_class
      allowed_classes = ["Commodity", "Section", "Chapter", "Heading"]
      klass = allowed_classes & [@row["referenced_class"]]
      klass.first.constantize || fail("#{@row["referenced_class"]} not allowed!")
    end
  end
end
