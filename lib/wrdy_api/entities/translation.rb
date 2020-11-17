# frozen_string_literal: true

class Translation < Hanami::Entity
  attributes do
    attribute :id,          Types::Int
    attribute :fluency,     Types::Int
    attribute :source,      Types::String
    attribute :translated,  Types::String
    attribute :created_at,  Types::Time
    attribute :updated_at,  Types::Time
    attribute :finished_at, Types::Time
  end
end
