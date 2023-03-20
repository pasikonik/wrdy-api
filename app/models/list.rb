# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :user
  has_many :words, dependent: :destroy

  validates :name, presence: true
end
