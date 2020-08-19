class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.boolean :player_1_turn, default: true
      t.boolean :finished, default: false
      t.integer :completedQuestions, default: 0

      t.timestamps
    end
  end
end
