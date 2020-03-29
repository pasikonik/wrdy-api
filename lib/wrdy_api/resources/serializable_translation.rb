class SerializableTranslation < JSONAPI::Serializable::Resource
  type 'translations'

  attributes :source, :translated, :fluency

  belongs_to :list
end
