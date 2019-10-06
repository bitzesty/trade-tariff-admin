require "csv"

class SearchReference
  class ExportService
    ATTRIBUTES = [
      :goodsnomenclature_type,
      :goodsnomenclature_code,
      :title
    ].freeze

    def initialize(collection)
      @collection = collection
    end

    def to_csv
      CSV.generate(headers: true) do |csv|
        csv << ATTRIBUTES

        @collection.each do |search_reference|
          values = ATTRIBUTES.map do |attr|
            search_reference.send(attr)
          end
          csv << values
        end
      end
    end
  end
end
