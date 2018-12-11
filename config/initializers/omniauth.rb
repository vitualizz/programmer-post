Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, ENV["instagram_api_key"], ENV["instagram_secret_key"]
  provider :facebook, ENV["facebook_api_key"], ENV["facebook_secret_key"], token_params: { parse: :json }
  provider :linkedin, ENV["linkedin_api_key"], ENV["linkedin_secret_key"], { scope: 'r_basicprofile',  token_params: { parse: :json } }
end

