require 'hanami/interactor'

class CreateUser
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
      repo.create({ email: email }.merge(:hashed_pass))
    else
      false
    end
  end

  private

  def validator(attributes)
    UserValidator.new attributes
  end
end
