module OmniAuth
  module Strategies
    class Passport < OmniAuth::Strategies::OAuth2
      option :name, :passport

      option :client_options, {
        site: ENV['PASSPORT_URL'],
        authorize_path: '/oauth/authorization'
      }

      uid do
        raw_info["id"]
      end

      info do
        {
          name: raw_info['name'],
          email: raw_info['email']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/user_info').parsed
      end
    end
  end
end
