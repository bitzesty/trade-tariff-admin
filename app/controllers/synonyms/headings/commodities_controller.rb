module Synonyms
  module Headings
    class CommoditiesController < ApplicationController
      def index
        @commodities = heading.commodities
      end

      private

      def heading
        @heading ||= Heading.find(params[:heading_id])
      end
      helper_method :heading
    end
  end
end
