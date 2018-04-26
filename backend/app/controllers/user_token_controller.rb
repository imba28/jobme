class UserTokenController < SessionsController
    def create
        reset_session

        unless !login_params[:name] then
            user = User.where(:name => login_params[:name]).first

            if user && user.authenticate(login_params[:password])
                render json: { user: user, auth_token: JsonWebToken.encode({user_id: user.id}) }, status: :ok
                return
            end
        end
    
        render json: { error: 'Invalid credentials!' }, status: :unauthorized
    end 
end