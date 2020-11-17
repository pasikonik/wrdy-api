# frozen_string_literal: true

class SerializableWord < JSONAPI::Serializable::Resource
  type 'words'

  attributes :orogin, :translation, :fluency

  belongs_to :list
end
