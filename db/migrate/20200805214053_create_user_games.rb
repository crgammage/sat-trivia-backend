class CreateUserGames < ActiveRecord::Migration[6.0]
  def change
    create_table :user_games do |t|
      t.integer :user1_id
      t.integer :user2_id
      t.integer :game_id

      t.timestamps
    end
  end
end
