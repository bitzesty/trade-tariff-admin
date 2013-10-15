module Synonyms
  module Sections
    class ChaptersController < ApplicationController
      def index
        @chapters = section.chapters
      end

      private

      def section
        @section ||= Section.find(params[:section_id])
      end
      helper_method :section
    end
  end
end
