require 'webmock/cucumber'

Before do
  WebMock.disable_net_connect!(:allow_localhost => true)
  stub_request(:post, "#{ENV["MEURIO_HOST"]}/rewards.json")
end
