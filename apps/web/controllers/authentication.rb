# frozen_string_literal: true

module Authentication
  module Skip
    def authenticate!
    end
  end

  def self.included(action)
    action.class_eval do
      before :authenticate!
    end
  end

  def authenticate!
    halt 401 unless authenticated?
  end

  def authenticated?
    !!current_user
  end

  def current_user
    user_id = validate_token ? validate_token['user_id'] : nil
    user = UserRepository.new.find(user_id)
  end

  def validate_token
    token_header = request.get_header('HTTP_AUTHORIZATION')
    token = token_header.gsub(/^Baread /, '')

    JsonWebToken.decode(token)
  rescue StandardError
    nil
  end
end
