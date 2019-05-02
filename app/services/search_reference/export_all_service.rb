class SearchReference
  class ExportAllService
    def to_csv
      ExportService.new(collection).to_csv
    end

    private

    def collection
      'a'.upto('z').inject([]) do |memo, letter|
        search_references = SearchReference.all(query: { letter: letter }).fetch
        memo.concat(search_references)
      end
    end
  end
end
