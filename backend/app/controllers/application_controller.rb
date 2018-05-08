# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def signed_in
    if authentication_id
      user = User.find authentication_id

      if user
        @current_user = user
        return true
      end
    end

    false
  end

  def admin?
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

  def current_user
    return false unless @current_user
    @current_user
  end

  def authenticate_admin!
    redirect_to login_path, notice: 'You need to log in as admin.' unless admin?
  end

  def authenticate_user!
    redirect_to login_path, notice: 'Please log in first.' unless signed_in
  end

  # ref: https://www.joshfry.me/blog/2016/07/21/ruby-on-rails-respond-to-json-only/
  def check_format
    unless admin?
      redirect_to root_url, notice: 'You are not authorized, please sign in as admin.' unless params[:format] == 'json' || request.headers['Accept'] =~ /json/
    end
  end

  helper_method :current_user
  helper_method :signed_in
  helper_method :admin?
  helper_method :authenticate_admin!
  helper_method :authenticate_user!
  helper_method :check_format

  private

  def authentication_id
    return session[:user_id] if session[:user_id]
    return auth_token[:user_id] if user_id_in_token?
  end

  def http_token
    @http_token ||= request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end
end
