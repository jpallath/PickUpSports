class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :type_of
      t.string :name
      t.string :location
      t.string :description
      t.string :longitude
      t.string :latitude
      t.date :gamedate
      t.time :gametime
      t.string :address
      t.string :city
      t.string :state
      t.integer :max_players
      t.references :creator :limit => 8

      t.timestamps null: false
    end
  end
end
