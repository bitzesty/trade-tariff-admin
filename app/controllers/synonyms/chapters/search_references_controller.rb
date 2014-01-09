module Synonyms
  module Chapters
    class SearchReferencesController < Synonyms::SearchReferencesController
      def update
        search_reference.referenced_id = search_reference.referenced_entity.id
        search_reference.referenced_class = 'Chapter'

        super
      end

      def destroy
        search_reference.referenced_id = search_reference.referenced_entity.id

        super
      end

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
