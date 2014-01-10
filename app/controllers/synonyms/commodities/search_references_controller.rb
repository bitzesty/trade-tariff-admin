module Synonyms
  module Commodities
    class SearchReferencesController < Synonyms::SearchReferencesController
      def update
        search_reference.referenced_id = search_reference.referenced_entity.id
        search_reference.referenced_class = 'Commodity'

        super
      end

      def destroy
        search_reference.referenced_id = search_reference.referenced_entity.id

        super
      end

      private

      def search_reference_parent
        @commodity ||= Commodity.find(params[:commodity_id])
      end
      alias :commodity :search_reference_parent
      helper_method :commodity

      def scope
        :synonyms
      end
    end
  end
end
