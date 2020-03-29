require 'hanami/interactor'
require 'bcrypt'

class AddUser
  include Hanami::Interactor

  expose :repo

  def initialize(repository: UserRepository.new)
    @repo = repository
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
    else
      error result.errors
    end
  end

  private

  def validator(attributes)
    UserValidator.new attributes
  end
end
