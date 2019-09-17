class AddDueDateToTodoList < ActiveRecord::Migration[5.1]
  def change
    add_column :todo_lists, :due_date, :datetime
  end
end
