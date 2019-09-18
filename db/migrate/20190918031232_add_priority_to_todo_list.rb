class AddPriorityToTodoList < ActiveRecord::Migration[5.1]
  def change
    add_column :todo_lists, :priority, :integer
  end
end
