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
      @goods_nomenclature_item_id = @row['goods_nomenclature_item_id']
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
        referenced_id
      )
    end

    def referenced_class
      goods_nomenclature_item_id = @row['goods_nomenclature_item_id']
      klass = if goods_nomenclature_item_id.ends_with?('00000000')
                'Chapter'
              elsif goods_nomenclature_item_id.ends_with?('000000')
                'Heading'
              elsif goods_nomenclature_item_id.length == 10
                'Commodity'
              else
                'Section'
              end
      klass.constantize
    end

    def referenced_id
      @row['goods_nomenclature_item_id'].gsub('00000000', '').gsub('000000', '')
    end
  end
end
