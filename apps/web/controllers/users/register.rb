# frozen_string_literal: true

require 'bcrypt'

module Web
  module Controllers
    module Users
      class Register
        include Web::Action
        include Authentication::Skip

        params do
          required(:email).filled(:str?)
          required(:password).filled(:str?)
        end

        def call(params)
          result = validator(params).validate
          if result.success?
            email = params[:email]
            hashed_pass = BCrypt::Password.create(params[:password])
            user_params = {
              email: email,
              hashed_pass: hashed_pass
            }
            repo.create(user_params)
            status 201, 'User has been created'
          else
            halt 404, result.errors
          end
        end

        private

        def repo
          @repo ||= UserRepository.new
        end

        def validator(attributes)
          UserValidator.new attributes
        end
      end
    end
  end
end
