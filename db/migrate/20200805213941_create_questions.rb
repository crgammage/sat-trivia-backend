class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :prompt
      t.string :a
      t.string :b
      t.string :c
      t.string :d
      t.string :answer
      t.integer :points

      t.timestamps
    end
  end
end
