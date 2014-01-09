class Section
  class SearchReference < ::SearchReference
    collection_path "sections/:referenced_id/search_references"
  end
end
