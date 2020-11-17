# frozen_string_literal: true

class ListValidator
  include Hanami::Validations

  validations do
    required(:name) { filled? & str? }
  end
end
