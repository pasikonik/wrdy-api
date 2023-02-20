class WordSerializer < ActiveModel::Serializer
  attributes :id, :origin, :translation, :proficiency

  belongs_to :list
end
