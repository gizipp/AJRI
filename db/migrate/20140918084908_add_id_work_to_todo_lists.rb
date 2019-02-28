class AddIdWorkToTodoLists < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_lists, :id_work, :integer
  end
end
