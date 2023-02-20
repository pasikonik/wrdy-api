class UsersController < ApplicationController
  skip_before_action :authenticate!, only: [:create]

  def create
    user = User.create(user_params)

    if user.valid?
      token = ::JsonWebToken.encode({ user_id: user.id })

      render json: { user:, token: }
    else
      render json: { errors: user.errors.full_messages }, status: :not_acceptable
    end
  end

  def me
    if user = current_user
      render json: user
    else
      render json: { errors: 'Wrong token' }
    end
  end

  private

  def user_params
    params.permit(:email, :username, :password)
  end
end
