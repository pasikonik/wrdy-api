# frozen_string_literal: true

require 'bcrypt'

module Web
  module Controllers
    module Sessions
      class Login
        include Web::Action
        include Authentication::Skip

        params do
          required(:email).filled(:str?)
          required(:password).filled(:str?)
        end

        def call(params)
          user = UserRepository.new.by_email(params[:email])

          if user && check_password?(user.hashed_pass, params[:password])
            jwt = JsonWebToken.encode(user_id: user.id)
            status 201, JSON.generate(auth_token: jwt)
          else
            halt 401, 'Authentication failure'
          end
        end

        private

        def check_password?(user_password, password)
          BCrypt::Password.new(user_password) == password
        end
      end
    end
  end
end
