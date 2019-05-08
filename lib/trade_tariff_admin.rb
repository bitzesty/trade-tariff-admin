require 'her/middleware/bearer_token_authentication'
require 'her/middleware/header_metadata_parse'
require 'her/middleware/accept_api_v2'
require 'redis_resolver'

module TradeTariffAdmin
  class << self
    def production?
      ENV["GOVUK_APP_DOMAIN"] == "tariff-admin-production.cloudapps.digital"
    end
  end
end
