module Synonyms
  module Commodities
    class SearchReferencesController < Synonyms::SearchReferencesController

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
