class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :type_of
      t.string :name
      t.string :location
      t.date :gamedate
      t.time :gametime
      t.integer :max_players

      t.timestamps null: false
    end
  end
end
