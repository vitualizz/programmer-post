Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, ENV["instagram_api_key"], ENV["instagram_secret_key"]
end

