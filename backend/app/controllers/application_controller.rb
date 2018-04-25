class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception

  def is_signed_in
    if session[:user_id] && User.exists?(session[:user_id])
      user = User.find session[:user_id]
      if user
        @current_user = user
        return true
      end
    end
    return false
  end

  def is_admin?
    if session[:user_id] && User.exists?(session[:user_id])
      user = User.find session[:user_id]
      if user.name == 'admin'
        @current_user = user
        return true
      end
    end
    return false
  end

  def get_current_user
    return false if not @current_user
    @current_user
  end

  def authenticate_admin!
    if !is_admin?
      redirect_to login_path, notice: 'You need to log in as admin.'
    end
  end

  def authenticate_user!
    if !is_signed_in
      redirect_to login_path, notice: 'Please log in first.'
    end
  end

  # ref: https://www.joshfry.me/blog/2016/07/21/ruby-on-rails-respond-to-json-only/
  def check_format
    if !is_admin?
      redirect_to root_url, notice: 'You are not authorized, please sign in as admin.' unless params[:format] == 'json' || request.headers["Accept"] =~ /json/
    end
  end

  helper_method :get_current_user
  helper_method :is_signed_in
  helper_method :is_admin?
  helper_method :authenticate_admin!
  helper_method :authenticate_user!
  helper_method :check_format
end
