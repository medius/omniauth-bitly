require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Bitly < OmniAuth::Strategies::OAuth2
      option :name, "bitly"
      option :client_options,{:site => 'https://api-ssl.bitly.com/',
                              :authorize_url => 'https://bitly.com/oauth/authorize',
                              :token_url => 'https://api-ssl.bitly.com/oauth/access_token'}

      option :token_params, {
        :parse => :query
      }

      uid{ access_token.params['login'] }


      info do
        {
          'login' => access_token.params['login']
        }
      end

      def callback_phase
        request.params["state"] = session["omniauth.state"] unless request.params["state"]
        super
      end
    end
  end
end
OmniAuth.config.add_camelization 'bitly', 'Bitly'
