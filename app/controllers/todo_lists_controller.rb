class TodoListsController < ApplicationController
  def index
    @list = TodoList.all
  end

  def new
    @list = TodoList.new
  end

  def create
    @list = TodoList.new(todo_list_params)
    respond_to do |format|
      if @list.save
        format.html { redirect_to  @list, notice: 'Todo list was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  

  def show
    @list = TodoList.last
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:title, :description)
  end

end
