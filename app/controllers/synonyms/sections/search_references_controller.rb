module Synonyms
  module Sections
    class SearchReferencesController < Synonyms::SearchReferencesController
      def update
        search_reference.referenced_id = search_reference.referenced_entity.id
        search_reference.referenced_class = 'Section'

        super
      end

      def destroy
        search_reference.referenced_id = search_reference.referenced_entity.id

        super
      end

      private

      def search_reference_parent
        @section ||= Section.find(params[:section_id])
      end
      alias :section :search_reference_parent
      helper_method :section

      def scope
        :synonyms
      end
    end
  end
end
