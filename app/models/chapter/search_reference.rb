class Chapter
  class SearchReference < ::SearchReference
    attributes :chapter_id

    collection_path "chapters/:chapter_id/search_references"
  end
end
