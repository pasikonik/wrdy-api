class AuthController < ApplicationController
  def login
    user = User.find_by(username: auth_params[:username])

    if user && user.authenticate(auth_params[:password])
      token = JWT.encode({user_id: @user.id})
      render json: { user: current_user, token: token }
    else
      render json: { errors: "No user log in" }
    end
  end

  def auth_login

  end

  private

  def auth_params
    params.permit(:username, :password)
  end
end
