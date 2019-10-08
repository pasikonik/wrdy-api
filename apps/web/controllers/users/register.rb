# frozen_string_literal: true

require 'bcrypt'

module Web
  module Controllers
    module Users
      class Register
        include Web::Action

        params do
          required(:email).filled(:str?)
          required(:password).filled(:str?)
        end

        def call(params)
          result = validator(params).validate
          if result.success?
            email = params[:email]
            hashed_pass = BCrypt::Password.create(params[:password])
            repo.create(email.merge(:hashed_pass))
          else
            byebug
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
