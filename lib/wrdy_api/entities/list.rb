# frozen_string_literal: true

class List < Hanami::Entity
  attributes do
    attribute :id,      Types::Int
    attribute :name,    Types::String
    attribute :user_id, Types::Int
    # attribute :words,   Types::Collection(::Word)
  end
end
