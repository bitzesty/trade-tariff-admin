module Her
  module Middleware
    class BearerTokenAuthentication < Faraday::Middleware
       def initialize(app, token = nil)
         super(app)
         @token = token && token.to_s
      end

      def call(env)
        env[:request_headers][:authorization] = authorization_header

        @app.call(env)
      end

      def authorization_header
        "Bearer #{@token}"
      end
    end
  end
end
