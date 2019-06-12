# order of included modules does matter: first included last executed
Her::API.setup url: Rails.application.config.api_host do |c|
  c.use Faraday::Request::UrlEncoded
  c.use Her::Middleware::HeaderMetadataParse  # lib/her/middleware/header_metadata_parse.rb
  c.use Her::Middleware::AcceptApiV2          # lib/her/middleware/accept_api_v2.rb
  c.use Her::Middleware::TariffJsonapiParser  # lib/her/middleware/tariff_jsonapi_parser.rb
  c.use Her::Middleware::BearerTokenAuthentication, ENV['BEARER_TOKEN'] || "tariff-api-test-token" # lib/her/middleware/bearer_token_authentication.rb
  c.use Faraday::Adapter::NetHttp
end
