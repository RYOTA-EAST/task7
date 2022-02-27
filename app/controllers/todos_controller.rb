class TodosController < ApplicationController
  before_action :set_todo, only: %i(show edit update)
  def index
    @todos = Todo.all
  end
  def show; end
  def new
    @todo = Todo.new
  end
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to root_path
    else
      render :new
    end
  end
  def edit; end
  def update
    if @todo.update(todo_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
  def set_todo
    @todo = Todo.find(params[:id])
  end
end
