class UserGame < ApplicationRecord
    belongs_to :game
    belongs_to :user1, class_name: 'User', optional: true
    belongs_to :user2, class_name: 'User', optional: true
end
