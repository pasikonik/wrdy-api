# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate!

  def authenticate!
    render json: { message: 'Please log in' }, status: :unauthorized unless authenticated?
  end

  def authenticated?
    !current_user.nil?
  end

  def current_user
    user_id = validate_token ? validate_token['user_id'] : nil
    User.find(user_id)
  end

  def validate_token
    token_header = request.headers['Authorization']
    token = token_header.gsub(/^Bearer /, '')

    JsonWebToken.decode(token)
  rescue StandardError
    nil
  end
end
