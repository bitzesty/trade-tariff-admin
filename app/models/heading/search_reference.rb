class Heading
  class SearchReference < ::SearchReference
    attributes :heading_id

    collection_path "headings/:heading_id/search_references"
  end
end
