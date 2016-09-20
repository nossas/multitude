require File.expand_path('lib/omniauth/strategies/passaporte', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :passaporte, ENV["PASSAPORTE_KEY"], ENV["PASSAPORTE_SECRET"]
end
