module Synonyms
  module Headings
    class SearchReferencesController < Synonyms::SearchReferencesController
      private

      def search_reference_parent
        @heading ||= Heading.find(params[:heading_id])
      end
      alias :heading :search_reference_parent
      helper_method :heading

      def scope
        :synonyms
      end
    end
  end
end
