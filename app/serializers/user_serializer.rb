class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :score, :level, :username, :password, :games
end
