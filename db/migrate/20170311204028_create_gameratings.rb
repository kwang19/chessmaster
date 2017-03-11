class CreateGameratings < ActiveRecord::Migration
  def change
    create_table :gameratings do |t|
      t.integer :user_id
      t.integer :value
      t.integer :game_id

      t.timestamps

    end
  end
end
