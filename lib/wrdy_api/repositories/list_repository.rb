# frozen_string_literal: true

class ListRepository < Hanami::Repository
  associations do
    belongs_to :user
    has_many :words
  end

  def lists_by_owner(user)
    lists.where(user_id: user.id).map_to(List)
  end
end
