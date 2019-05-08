module Synonyms
  class ExportsController < ApplicationController
    def create
      export_service = SearchReference::ExportAllService.new
      filename = "all-synonyms-#{Time.now.to_i}.csv"
      send_data export_service.to_csv,
                filename: filename
    end
  end
end
