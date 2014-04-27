module OmniAuth
  module Strategies
    class Keeper < OmniAuth::Strategies::OAuth2
      option :name, :keeper

      option :client_options, {
        site: ENV['KEEPER_URL'],
        authorize_path: "/oauth/authorize"
      }

      uid do
        raw_info["id"]
      end

      info do
        {
          email: raw_info["email"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me').parsed
      end
    end
  end
end
