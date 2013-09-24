module Chapters
  class SearchReferencesController < ::SearchReferencesController
    private

    def search_reference_parent
      @chapter ||= Chapter.find(params[:chapter_id])
    end
    alias :chapter :search_reference_parent
    helper_method :chapter
  end
end
