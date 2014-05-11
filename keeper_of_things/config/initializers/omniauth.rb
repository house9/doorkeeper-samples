require File.expand_path('lib/omniauth/strategies/keeper', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :keeper, ENV["INTERNAL_APP_ONE_OAUTH_ID"], ENV["INTERNAL_APP_ONE_OAUTH_SECRET"]
end
