require File.expand_path('lib/omniauth/strategies/passport', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :passport, ENV["PASSPORT_KEY"], ENV["PASSPORT_SECRET"]
end
