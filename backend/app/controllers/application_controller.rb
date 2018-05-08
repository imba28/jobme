class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def is_signed_in
    if authentication_id
      user = User.find authentication_id

      if user
        @current_user = user
        return true
      end
    end

    false
  end

  def is_admin?
    return @current_user.name == 'admin' if @current_user

    user_id = authentication_id
    if user_id
      user = User.find user_id
      if user.name == 'admin'
        @current_user = user
        return true
      end
    end
    false
  end

  def get_current_user
    return false unless @current_user
    @current_user
  end

  def authenticate_admin!
    redirect_to login_path, notice: 'You need to log in as admin.' unless is_admin?
  end

  def authenticate_user!
    redirect_to login_path, notice: 'Please log in first.' unless is_signed_in
  end

  # ref: https://www.joshfry.me/blog/2016/07/21/ruby-on-rails-respond-to-json-only/
  def check_format
    unless is_admin?
      redirect_to root_url, notice: 'You are not authorized, please sign in as admin.' unless params[:format] == 'json' || request.headers['Accept'] =~ /json/
    end
  end

  helper_method :get_current_user
  helper_method :is_signed_in
  helper_method :is_admin?
  helper_method :authenticate_admin!
  helper_method :authenticate_user!
  helper_method :check_format

  private

  def authentication_id
    return session[:user_id] if session[:user_id]
    return auth_token[:user_id] if user_id_in_token?
  end

  def http_token
    @http_token ||= if request.headers['Authorization'].present?
                      request.headers['Authorization'].split(' ').last
      end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end
end
