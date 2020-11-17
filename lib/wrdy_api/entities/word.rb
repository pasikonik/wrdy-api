# frozen_string_literal: true

class Word < Hanami::Entity
  attributes do
    attribute :id,          Types::Int
    attribute :fluency,     Types::Int
    attribute :origin,      Types::String
    attribute :translation, Types::String
    attribute :created_at,  Types::Time
    attribute :updated_at,  Types::Time
    attribute :finished_at, Types::Time
    attribute :list_id,     Types::Int
  end
end
