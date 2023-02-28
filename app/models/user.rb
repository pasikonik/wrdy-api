# frozen_string_literal: true

class User < ApplicationRecord
  include ActiveModel::Serializers::JSON

  has_secure_password

  has_many :lists, dependent: :destroy

  def attributes
    { 'id' => nil, 'username' => nil, 'email' => nil }
  end
end
