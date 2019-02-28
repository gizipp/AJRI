class AddTodoListIdToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :todo_list_id, :integer
  end
end
