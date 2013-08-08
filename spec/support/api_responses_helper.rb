module ApiResponsesHelper
  def stub_api_for(klass)
    klass.use_api (api = Her::API.new)

    api.setup url: "http://api.example.com" do |c|
      c.use Her::Middleware::FirstLevelParseJSON
      c.adapter(:test) { |s| yield(s) }
    end
  end

  def api_response_success(response)
     [200, {}, response.to_json]
  end
end
