Her::API.setup url: Rails.application.config.api_host do |c|
  c.use Faraday::Request::BasicAuthentication, ENV['TRADE_TARIFF_USER'], ENV['TRADE_TARIFF_PASSWORD']
  c.use Faraday::Request::UrlEncoded
  c.use Her::Middleware::AcceptJSON
  c.use Her::Middleware::HeaderMetadataParse # lib/her/middleware/header_metadata_parse.rb
  c.use Her::Middleware::DefaultParseJSON
  c.use Faraday::Adapter::NetHttp
end
