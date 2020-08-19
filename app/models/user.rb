class User < ApplicationRecord
    has_many :user1, class_name: 'UserGame', foreign_key: "user1_id"
    has_many :user2, class_name: 'UserGame', foreign_key: "user2_id"
    has_many :games
    has_many :questions, through: :games
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false}
    validates :name, presence: true

    def user_games
        self.user1 + self.user2
    end

    def games
        self.user_games.map do |user_game|
            user_game.game
        end
    end

end
