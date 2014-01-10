class Commodity
  class SearchReference < ::SearchReference
    collection_path "commodities/:referenced_id/search_references"
  end
end
