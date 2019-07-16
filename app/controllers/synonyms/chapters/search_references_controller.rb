module Synonyms
  module Chapters
    class SearchReferencesController < Synonyms::SearchReferencesController

      private

      def search_reference_parent
        @chapter ||= Chapter.find(params[:chapter_id])
      end
      alias :chapter :search_reference_parent
      helper_method :chapter

      def scope
        :synonyms
      end
    end
  end
end
