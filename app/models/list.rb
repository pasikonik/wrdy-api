# frozen_string_literal: true

class List < ApplicationRecord
  include ActiveModel::Serializers::JSON

  belongs_to :user
  has_many :words, dependent: :destroy

  validates :name, presence: true

  def attributes
    { 'id' => nil, 'name' => nil }
  end
end
