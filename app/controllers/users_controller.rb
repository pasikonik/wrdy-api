# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate!, only: [:create]

  ONLY_ATTRIBUTES = %i[email].freeze

  def create
    user = User.create(user_params)

    if user.valid?
      token = ::JsonWebToken.encode({ user_id: user.id })

      render json: { user:, token: }, only: ONLY_ATTRIBUTES
    else
      render json: { errors: user.errors.full_messages }, status: :not_acceptable
    end
  end

  def me
    if (user = current_user)
      render json: user, only: ONLY_ATTRIBUTES
    else
      render json: { errors: 'Wrong token' }
    end
  end

  private

  def user_params
    params.permit(:email, :username, :password)
  end
end
