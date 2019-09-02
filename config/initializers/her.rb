# order of included modules does matter: first included last executed
Her::API.setup url: Rails.application.config.api_host do |c|
  # Request
  c.use Faraday::Request::UrlEncoded
  c.use Her::Middleware::BearerTokenAuthentication, ENV['BEARER_TOKEN'] || "tariff-api-test-token" # lib/her/middleware/bearer_token_authentication.rb

  # Response
  c.use Her::Middleware::HeaderMetadataParse  # lib/her/middleware/header_metadata_parse.rb
  c.use Her::Middleware::TariffJsonapiParser  # lib/her/middleware/tariff_jsonapi_parser.rb

  # Adapter
  c.use Faraday::Adapter::NetHttp
end
