# TODO change url, plek?
Her::API.setup url: "http://tariff-api.dev.gov.uk" do |connection|
  connection.use Faraday::Request::UrlEncoded
  connection.use Her::Middleware::DefaultParseJSON
  connection.use Faraday::Adapter::NetHttp
end
