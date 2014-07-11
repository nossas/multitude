require 'webmock/cucumber'

Before do
  WebMock.disable_net_connect!(:allow_localhost => true)
  stub_request(:post, "#{ENV["MEURIO_HOST"]}/rewards.json")
  stub_request(:any, /.*memberships.*/)
  stub_request(:any, /.*segment_subscriptions.*/)
end
