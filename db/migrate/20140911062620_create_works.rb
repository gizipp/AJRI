class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end

    add_index :works, :user_id
  end
end
