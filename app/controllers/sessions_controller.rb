class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    @current_user = @user
    session['user_uid'] = @user.uid
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
