module GDS
  module SSO
    module Config
      def self.use_mock_strategies?
        ['development', 'test', 'docker'].include?(Rails.env) && ENV['GDS_SSO_STRATEGY'] != 'real'
      end
    end
  end
end

GDS::SSO.config do |config|
  config.user_model   = "User"
  config.oauth_id     = ENV['TARIFF_ADMIN_OAUTH_ID'] || "abcdefghjasndjkasndtariffadmin"
  config.oauth_secret = ENV['TARIFF_ADMIN_OAUTH_SECRET'] || "secret"
  config.oauth_root_url = Plek.current.find("signon")
end
