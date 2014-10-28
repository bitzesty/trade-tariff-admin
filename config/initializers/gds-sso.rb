require_relative '../../lib/gds-sso/config'

GDS::SSO.config do |config|
  config.user_model   = "User"
  config.oauth_id     = ENV['TARIFF_ADMIN_OAUTH_ID'] || "abcdefghjasndjkasndtariffadmin"
  config.oauth_secret = ENV['TARIFF_ADMIN_OAUTH_SECRET'] || "secret"
  config.oauth_root_url = Plek.current.find("signon")
end
