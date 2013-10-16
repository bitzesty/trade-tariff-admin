module Notes
  class ChaptersController < ApplicationController
    respond_to :json

    def index
    end

    def show
      respond_with chapter
    end

    private

    def chapter
      @chapter ||= Chapter.find(params[:id])
    end
    helper_method :chapter
  end
end
