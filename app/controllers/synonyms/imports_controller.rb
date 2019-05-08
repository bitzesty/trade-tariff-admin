module Synonyms
  class ImportsController < ApplicationController
    def show
    end

    def create
      csv_file = params[:synonyms_import][:file]
      SearchReference::ImportService.from_csv!(csv_file)
      redirect_to(synonyms_sections_path, notice: 'Synonyms have been imported')
    end
  end
end
