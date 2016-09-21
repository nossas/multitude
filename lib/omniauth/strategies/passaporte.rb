module OmniAuth
  module Strategies
    class Passaporte < OmniAuth::Strategies::OAuth2
      option :name, :passaporte

      option :client_options, {
        site: ENV['PASSAPORTE_URL'],
        authorize_url: '/dialog/authorize',
        token_params: { grant_type: 'code' }
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
        @raw_info ||= access_token.get('/api/userinfo').parsed
      end
    end
  end
end
