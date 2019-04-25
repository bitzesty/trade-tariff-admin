class SearchReference
  class ExportAllService
    def to_csv
      ExportService.new(collection).to_csv
    end

    private

    def collection
      SearchReference.all
    end
  end
end
