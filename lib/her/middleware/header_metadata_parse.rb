# Her expects metadata to be passed inside response body
# This allows metadata to be passed using custom X-Meta HTTP header
# which is more convenient to the Tariff's API backend

module Her
  module Middleware
    class HeaderMetadataParse < Her::Middleware::ParseJSON
      def meta_data(header)
        parse_json(header)
      end

      def on_complete(env)
        if env[:response_headers].key?('x-meta')
          env[:body].deep_merge!({metadata: meta_data(env[:response_headers]['x-meta'])})
        else
          env[:body]
        end
      end
    end
  end
end
