class TariffUpdatesController < ApplicationController
  def index
    @tariff_updates = TariffUpdate.all.fetch
  end
end
