class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.date :due_date
      t.string :name
      t.string :description

      t.timestamps
      t.boolean :status
    end

    add_index :tasks, :user_id
  end
end
