# frozen_string_literal: true

class ListSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :words
  belongs_to :user
end
