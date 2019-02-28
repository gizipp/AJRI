class AddStatusToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :status, :boolean, :default => 0
  end
end
