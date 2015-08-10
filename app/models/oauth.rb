require 'googleauth'
require 'signet'
# require 'google-api-client'
# require 'google/api_client/client_secrets'
require 'json'
# require 'launchy'
# require 'thin'
require 'rest-client'
class Oauth
  def self.credentials
    client = Signet::OAuth2::Client.new(
      :authorization_uri => 'https://api.instagram.com/oauth/authorize/?',
      :token_credential_uri => 'https://api.instagram.com/oauth/access_token',
      :redirect_uri => 'http://youtube.aggso.com/instagram',
      :client_id => '2ea0e1c786e64e368784913c1b1202b0',
      :client_secret => '5d4b994a563b490fa4374e2074446b17',
      :options => {:response_type=>"code",approval_prompt: :force,access_type: :offline}
      # :scope => 'https://www.google.com/m8/feeds/'
      )
    return client
  end
end