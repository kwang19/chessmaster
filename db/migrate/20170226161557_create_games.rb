class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :pgn
      t.string :eventname
      t.integer :user_id
      t.date :eventdate
      t.string :white
      t.string :black
      t.string :result

      t.timestamps

    end
  end
end
