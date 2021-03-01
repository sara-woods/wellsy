class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.date :start_time
      t.date :end_time
      t.integer :min_participants
      t.integer :max_participants
      t.integer :price
      t.references :activity, null: false, foreign_key: true
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
