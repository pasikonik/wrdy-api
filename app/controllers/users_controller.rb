class UsersController < ApplicationController
  def create
    user = User.create(user_params)

    if user.valid?
      token = encode_token({ user_id: user.id })
      render json: { user: user, token: token }
    else
      render json: { errors: user.errors.full_messages }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.permit(:email, :username, :password)
  ende
end
