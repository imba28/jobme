class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception

  def is_signed_in
    if session[:user_id]
      user = User.find session[:user_id]
      if user
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

  helper_method :get_current_user
  helper_method :is_signed_in
end
