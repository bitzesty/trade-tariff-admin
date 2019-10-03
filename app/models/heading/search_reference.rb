class Heading
  class SearchReference < ::SearchReference
    collection_path '/admin/headings/:referenced_id/search_references'
    type self.name.demodulize.tableize
  end
end
