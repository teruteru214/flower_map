class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :flower, null: false, foreign_key: true
      t.text :comment

      t.timestamps
    end
    add_index :likes, [:user_id, :flower_id], unique: true
  end
end
