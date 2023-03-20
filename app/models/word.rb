# frozen_string_literal: true

class Word < ApplicationRecord
  belongs_to :list

  validates :origin, :translation, presence: true
end
