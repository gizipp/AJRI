class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.datetime :deadline

      t.timestamps
    end

    add_index :goals, :user_id
  end
end
