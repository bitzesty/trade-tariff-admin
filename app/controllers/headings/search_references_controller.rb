module Headings
  class SearchReferencesController < ::SearchReferencesController
    private

    def search_reference_parent
      @heading ||= Heading.find(params[:heading_id])
    end
    alias :heading :search_reference_parent
    helper_method :heading
  end
end
