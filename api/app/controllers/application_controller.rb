class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  def current_user
    if session[:user_id]
      @current_user ||= User.where(id: session[:user_id]).first
    end
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
end