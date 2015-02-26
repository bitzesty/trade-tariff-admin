module ApiResponsesHelper
  def stub_api_for(klass)
    klass.use_api (api = Her::API.new)

    api.setup url: Rails.application.config.api_host do |c|
      c.use Her::Middleware::HeaderMetadataParse # lib/her/middleware/header_metadata_parse.rb
      c.use Her::Middleware::FirstLevelParseJSON
      c.adapter(:test) { |s| yield(s) }
    end
  end

  def api_success_response(response = {}, headers = {})
     [200, headers, response.to_json]
  end

  def api_created_response(body = {}, headers = {})
    api_response(201, headers, body)
  end

  def api_no_content_response(body = {}, headers = {})
    api_response(204, headers, body)
  end

  def api_response(status, headers, body)
    [status, headers, body.to_json]
  end
end
