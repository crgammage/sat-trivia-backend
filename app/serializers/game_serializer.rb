class GameSerializer < ActiveModel::Serializer
  attributes :id, :questions, :users
end
