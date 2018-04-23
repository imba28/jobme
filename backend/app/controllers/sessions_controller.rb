class SessionsController < ApplicationController
  # login form
  def new

  end

  # login post request
  def create
    params = login_params
    user = User.find_by(name: params[:name])

    if user && user.authenticate(params[:password])
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
