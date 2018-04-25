class SessionsController < ApplicationController
<<<<<<< HEAD
  #skip_before_action :verify_authenticity_token

=======
  skip_before_action :verify_authenticity_token
>>>>>>> 772b9b80179188d9a622ca4353a98d9a058a8bb3
  # login form
  def new

  end

  # login post request
  def create
    reset_session
    # IF OMNIAUTH IS USED
    if request.env['omniauth.auth']
      user = User.find_or_create_with_omniauth(request.env['omniauth.auth'])
      if user
        session[:user_id] = user.uid
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
        if user.name != 'admin'
          respond_to do |format|
            format.html {redirect_to "https://jobme.surge.sh"}
            format.json { render json: { user: user, auth_token: 'tokenLmaslkdmlknsdnsdln' }, status: :ok }
          end
        else 
          respond_to do |format|
            format.html {redirect_to root_path, notice: 'Welcome, admin!'}
            format.json { render json: { user: user, auth_token: 'tokenLmaslkdmlknsdnsdln' }, status: :ok }
          end
        end
      else
        respond_to do |format|
          format.html { redirect_to login_path, alert: 'Log in failed' }
          format.json { render json: {}, status: :unauthorized }
        end
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
