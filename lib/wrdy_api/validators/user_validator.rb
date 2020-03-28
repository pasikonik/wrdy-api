# frozen_string_literal: true

class UserValidator
  include Hanami::Validations

  predicate :email?, message: 'must be an email' do |current|
    current =~ URI::MailTo::EMAIL_REGEXP
  end

  validations do
    required(:email) { filled? & str? & email? }
    required(:password) { filled? & str? & min_size?(8) }
  end
end
