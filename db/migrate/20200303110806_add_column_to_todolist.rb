class AddColumnToTodolist < ActiveRecord::Migration[5.2]
  def change
    add_column :todolists, :duedate, :datetime
    add_column :todolists, :sorting, :integer, default: 0
  end
end
