class PictureTokensController < ApplicationController
  def rz_xieye
    @auth_uri = PictureToken.get_auth_uri
  end
  def instagram
    PictureToken.save_oauth_code(params[:code])
    @token_hash = PictureToken.get_access_token
  end
end
