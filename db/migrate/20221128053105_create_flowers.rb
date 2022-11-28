class CreateFlowers < ActiveRecord::Migration[7.0]
  def change
    create_table :flowers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :spot, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :season, null: false
      t.datetime :date, null: false
      t.integer :status, null: false
      t.string :flower_word
      t.date :birth_flower

      t.timestamps
    end
  end
end
