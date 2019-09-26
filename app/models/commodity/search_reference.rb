class Commodity
  class SearchReference < ::SearchReference
    collection_path '/admin/commodities/:referenced_id/search_references'
    type self.name.demodulize.tableize
  end
end
