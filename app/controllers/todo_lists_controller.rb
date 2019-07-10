class TodoListsController < ApplicationController
  def index
    @list = TodoList.all
  end
end
