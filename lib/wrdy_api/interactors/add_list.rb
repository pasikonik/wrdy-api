# frozen_string_literal: true

require 'hanami/interactor'

class AddList
  include Hanami::Interactor

  def initialize(repository: ListRepository.new)
    @repo = repository
  end

  def call(params, current_user_id)
    result = validator(params).validate

    if result.success?
      list_params = {
        name: params[:name],
        user_id: current_user_id
      }
      @repo.create(list_params)
    else
      error result.error
    end
  end

  private

  def validator(attributes)
    ListValidator.new attributes
  end
end
