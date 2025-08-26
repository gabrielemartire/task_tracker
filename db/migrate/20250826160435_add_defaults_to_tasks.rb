class AddDefaultsToTasks < ActiveRecord::Migration[8.0]
  def change
    change_column_default :tasks, :status, 0
    change_column_default :tasks, :priority, 3
  end
end