class HerPaginationParser < Faraday::Response::Middleware
  def on_complete(env)
    pagination = JSON.parse(
      env[:response_headers]["x-pagination"],
      symbolize_names: true
    )
    env[:body][:pagination] = pagination
  end
end
