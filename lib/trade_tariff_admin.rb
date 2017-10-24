require 'her/middleware/bearer_token_authentication'
require 'her/middleware/header_metadata_parse'

module TradeTariffAdmin
  def production?
    ENV["GOVUK_APP_DOMAIN"] == "tariff-admin-production.cloudapps.digital"
  end
end
