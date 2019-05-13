module Her
  module Middleware
    # This middleware adds a "Accept: application/vnd.uktt.v2" HTTP header
    class AcceptApiV2 < Faraday::Middleware
      # @private
      def add_header(headers)
        headers.merge! "Accept" => "application/vnd.uktt.v2"
      end

      # @private
      def call(env)
        add_header(env[:request_headers])
        @app.call(env)
      end
    end
  end
end
