module Synonyms
  class SectionsController < ApplicationController
    respond_to :json

    def show
      respond_with section
    end

    def index
      @sections = Section.all
    end

    private

    def section
      @section ||= Section.find(params[:id])
    end
    helper_method :section
  end
end
