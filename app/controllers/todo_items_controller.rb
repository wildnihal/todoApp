class TodoItemsController < ApplicationController

  before_action :set_todo_list
  before_action :set_todo_item, only: [:destroy, :complete]
  def create
    @todo_item = @list.todo_items.create(todo_item_params)
    redirect_to @list
  end

  def destroy
    @todo_item.destroy
    redirect_to @list
  end

  def complete
    @todo_item.update_attribute(:completed_at, Time.now)
    redirect_to @list
  end
  private

  def set_todo_list
    @list = TodoList.find(params[:todo_list_id])
  end

  def set_todo_item
    @todo_item = @list.todo_items.find(params[:id])
  end

  def todo_item_params
    params[:todo_item].permit(:content)
  end
end
