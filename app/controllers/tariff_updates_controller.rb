class TariffUpdatesController < ApplicationController
  def index
    @tariff_updates = TariffUpdate.all(page: current_page).fetch
  end
end
