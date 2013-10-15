module Synonyms
  module Headings
    class SearchReferencesController < ::SearchReferencesController
      def update
        search_reference.heading_id = search_reference.referenced_entity.heading_id

        super
      end

      def destroy
        search_reference.heading_id = search_reference.referenced_entity.heading_id

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
