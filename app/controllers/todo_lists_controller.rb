class TodoListsController < ApplicationController

before_action :authenticate_user!
  def index
    @list = TodoList.all
  end

  def new
    @list = TodoList.new
  end

  def create
    @list = TodoList.new(todo_list_params)
    respond_to do |format|
      debugger
      if @list.save
        format.html { redirect_to  @list, notice: 'Todo list was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @list = TodoList.find(params[:id])

  end

  def update
    @list = TodoList.find(params[:id])
    if @list.update_attributes(todo_list_params)
      flash[:success] = "Profile  updated"
      redirect_to @list
    else
      flash[:danger] = "Profile couldn't be updated"
      render 'edit'
    end

  end

  def show
    @list = TodoList.find(params[:id])
  end

  private

  def todo_list_params
    debugger
    params.require(:todo_list).permit(:title, :description, :user_id)
  end

end
