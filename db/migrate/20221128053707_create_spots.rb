class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
      t.references :flower, null: false, foreign_key: true
      t.integer :latitude
      t.integer :longitude
      t.text :address

      t.timestamps
    end
  end
end
