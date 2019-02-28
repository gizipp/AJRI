class AddWorkIdToTodoLists < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_lists, :work_id, :integer
  end
end
