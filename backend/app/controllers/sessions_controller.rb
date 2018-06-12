# frozen_string_literal: true

class SessionsController < ApplicationController
  # skip_before_action :verify_authenticity_token

  # login form
  def new
    
  end

  # login post request
  def create
    reset_session
    par = login_params
    user = User.find_by(name: par[:name])
    if user&.authenticate(par[:password])
      session[:user_id] = user.id
      if user.name != 'admin'
        respond_to do |format|
          format.html { redirect_to 'https://jobme.surge.sh' }
        end
      else
        respond_to do |format|
          format.html { redirect_to root_path, notice: 'Welcome, admin!' }
        end
      end
    else
      respond_to do |format|
        format.html { render :new, alert: 'Log in failed' }
      end
    end
  end

  def destroy
    reset_session

    redirect_to root_path, notice: 'Bye!'
  end

  private

    def login_params
      params.permit(:name, :password)
    end
end
