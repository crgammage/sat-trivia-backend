class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :password, :score, :level
end
