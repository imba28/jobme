class SessionsController < ApplicationController
  # login form
  def new

  end

  # login post request
  def create
    user = User.find_or_create_with_omniauth(request.env['omniauth.auth'])

    if user
      reset_session
      session[:user_id] = user.id
      redirect_to root_path, notice: "welcome back #{user.name}!"
    else
      redirect_to login_path, alert: 'login failed'
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
