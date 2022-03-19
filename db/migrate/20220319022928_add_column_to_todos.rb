class AddColumnToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :status_id, :integer
    add_column :todos, :priority_id, :integer
    add_column :todos, :deadline, :datetime
  end
end
