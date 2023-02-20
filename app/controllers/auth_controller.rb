# frozen_string_literal: true

class AuthController < ApplicationController
  skip_before_action :authenticate!

  def login
    user = User.find_by(email: auth_params[:email])

    if user&.authenticate(auth_params[:password])
      token = ::JsonWebToken.encode({ user_id: user.id })
      render json: { user:, token: }
    else
      render json: { errors: 'No user log in' }
    end
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
