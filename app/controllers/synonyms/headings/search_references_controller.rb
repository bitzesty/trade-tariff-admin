module Synonyms
  module Headings
    class SearchReferencesController < Synonyms::SearchReferencesController
      def update
        search_reference.referenced_id = search_reference.referenced_entity.id
        search_reference.referenced_class = 'Heading'

        super
      end

      def destroy
        search_reference.referenced_id = search_reference.referenced_entity.id

        super
      end

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
