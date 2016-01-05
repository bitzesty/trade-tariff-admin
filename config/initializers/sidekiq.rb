url = Rails.application.secrets.redis_url || "redis://localhost:6379/12"

Sidekiq.configure_server do |config|
  config.redis = { url: url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: url }
end
