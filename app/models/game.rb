class Game < ApplicationRecord
    has_many :user_games
    has_many :user1s, through: :user_games, source: :user1
    has_many :user2s, through: :user_games, source: :user2
    has_many :game_questions
    has_many :questions, through: :game_questions

end
