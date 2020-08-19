class UserGameSerializer < ActiveModel::Serializer
  attributes :id, :user, :game
end
