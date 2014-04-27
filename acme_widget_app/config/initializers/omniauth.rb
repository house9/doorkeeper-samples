require File.expand_path('lib/omniauth/strategies/keeper', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :keeper, ENV["OAUTH_ID"], ENV["OAUTH_SECRET"]
end
