class CreateFlowers < ActiveRecord::Migration[7.0]
  def change
    create_table :flowers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :spot, null: false, foreign_key: true
      t.string :name
      t.integer :season
      t.datetime :date
      t.integer :status
      t.string :flower_word
      t.date :birth_flower

      t.timestamps
    end
  end
end
