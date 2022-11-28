class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
      t.references :flower, null: false, foreign_key: true
      t.integer :latitude, null: false
      t.integer :longitude, null: false
      t.text :address, null: false

      t.timestamps
    end
  end
end
