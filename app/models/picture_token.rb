class PictureToken < ActiveRecord::Base
  def self.get_auth_uri
    # Oauth2.init_open_auth
    client = Oauth.credentials
    auth_uri = (client.authorization_uri(options={})).to_s
  end
  def self.save_oauth_code(code)
    if RzOauth2.where(id: 1).first == nil
      rz_oauth2 = RzOauth2.new
      rz_oauth2.code = code
      rz_oauth2.save    
    else
      rz_oauth2 = RzOauth2.where(id: 1).first
      rz_oauth2.code = code
      rz_oauth2.save  
    end
  end
  def self.get_access_token
    client = Oauth.credentials
    rz_oauth2= RzOauth2.where(id: 1).first
    client.code= rz_oauth2.code
    token_hash = client.fetch_access_token!
    # if token_hash != nil
    #   open_auth.access_token = token_hash["access_token"]
    #   open_auth.token_type = token_hash["token_type"]
    #   open_auth.expires_in = token_hash["expires_in"]
    #   open_auth.update = Time.now
    #   open_auth.save
    # end
    return token_hash
  end
end
