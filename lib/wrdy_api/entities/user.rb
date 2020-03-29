# frozen_string_literal: true

class User < Hanami::Entity
  attributes do
    attribute :id,                     Types::Int
    attribute :email,                  Types::String
    attribute :hashed_pass,            Types::String
    attribute :password_reset_sent_at, Types::Time
    attribute :role,                   Types::String
  end
end
