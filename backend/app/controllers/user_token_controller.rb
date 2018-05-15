# frozen_string_literal: true

class UserTokenController < SessionsController
  def create
    reset_session

    if login_params[:name]
      user = User.where(name: login_params[:name]).first

      if user&.authenticate(login_params[:password])
        render json: {
          user: {
            id: user.id,
            name: user.name,
            avatar_url: view_context.asset_url(user.avatar_url)
          },
          auth_token: JsonWebToken.encode(
            user_id: user.id
          )
        },
               status: :ok
        return
      end
    end

    render json: { error: 'Invalid credentials!' }, status: :unauthorized
  end
end
