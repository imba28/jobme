class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  def current_user
    dec_auth = decoded_auth_token()
    if dec_auth then
      @current_user = User.find(@decoded_auth_token[:user_id])
    else
      if session[:user_id]
        @current_user ||= User.where(id: session[:user_id]).first
      end
    end

    @current_user
  end

  def user_signed_in?
      return current_user != nil
  end

  def authenticate_user!
    if !(user_signed_in?)
      respond_to do |format|
        format.html { redirect_to login_path, notice: 'Login required!' }
        format.json { render json: {error: true, message: 'Login required!'}, status: :unauthorized }
      end
    end
  end

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :authenticate_user!


  private
    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end

    def http_auth_header
      if request.headers['authorization'].present?
        return request.headers['authorization'].split(' ').last
      end
      nil
    end
end