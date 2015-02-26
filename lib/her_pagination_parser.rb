class HerPaginationParser < Faraday::Response::Middleware
  def on_complete(env)
    return unless env[:response_headers]["x-pagination"].present?
    pagination = JSON.parse(
      env[:response_headers]["x-pagination"],
      symbolize_names: true
    )
    env[:body][:pagination] = pagination
  end
end
