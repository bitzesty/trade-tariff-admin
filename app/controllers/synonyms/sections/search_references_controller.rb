module Synonyms
  module Sections
    class SearchReferencesController < ::SearchReferencesController
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
