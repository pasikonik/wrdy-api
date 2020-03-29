class SerializableList < JSONAPI::Serializable::Resource
  type 'lists'

  attributes :name

  belongs_to :user
end
