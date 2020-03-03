class ChangeColumnToTodolist < ActiveRecord::Migration[5.2]
  def change
  	change_column :todolists, :duedate, :text
  end
end
