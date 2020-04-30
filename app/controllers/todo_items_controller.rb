class TodoItemsController < ApplicationController

  before_action :set_todo_list

  def create
    @todo_item = @list.todo_items.create(todo_item_params)
    redirect_to @list
  end

  def destroy
    @todo_item = @list.todo_items.find(params[:id])
    @todo_item.destroy
    redirect_to @list
  end

  private

  def set_todo_list
    @list = TodoList.find(params[:todo_list_id])
  end

  def todo_item_params
    params[:todo_item].permit(:content)
  end
end
