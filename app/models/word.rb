# frozen_string_literal: true

class Word < ApplicationRecord
  include ActiveModel::Serializers::JSON

  belongs_to :list

  validates :origin, :translation, presence: true

  def attributes
    {
      'id' => nil,
      'origin' => nil,
      'translation' => nil,
      'proficiency' => nil,
      'language' => nil,
      'list_id' => nil
    }
  end
end
