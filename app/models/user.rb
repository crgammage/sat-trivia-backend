class User < ApplicationRecord
    has_many :user_games
    has_many :games, through: :user_games
    has_many :questions, through: :games
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false}
    validates :password, presence: true
    validates :name, presence: true
end
