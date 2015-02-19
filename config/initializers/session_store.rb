Rails.application.config.session_store :redis_store,
  servers: Rails.application.config.session_store_servers,
  expires_in: 1.day
