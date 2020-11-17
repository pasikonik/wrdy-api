# frozen_string_literal: true

require 'hanami/interactor'

class AddList
  include Hanami::Interactor

  expose :repo

  def initialize(repository: ListRepository.new)
    @repo = repository
  end

  def call(params, current_user)
    result = validator(params).validate
    byebug
    if result.sucess?
      list_params = {
        name: params.name,
        user_id: current_user.id
      }
      repo.create(list_params)
    else
      error result.error
    end
  end

  private

  def validator(attributes)
    ListValidator.new attributes
  end
end
