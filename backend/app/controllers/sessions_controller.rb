class SessionsController < ApplicationController
  # login form
  def new

  end

  # login post request
  def create
    # IF OMNIAUTH IS USED
    if request.env['omniauth.auth']
      user = User.find_or_create_with_omniauth(request.env['omniauth.auth'])
      if user
        reset_session
        session[:user_id] = user.id
        redirect_to root_path, notice: "Welcome back #{user.name}!"
      else
        redirect_to login_path, alert: 'login failed'
      end
    # IF CLASSIC LOGIN IS USED
    else
      par = login_params
      user = User.find_by(name: par[:name])
      if user && user.authenticate(par[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in'
      else
        redirect_to login_path, alert: 'Log in failed'
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