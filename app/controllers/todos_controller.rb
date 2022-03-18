class TodosController < ApplicationController
  before_action :logged_in_user
  before_action :set_todo, only: %i(show edit update destroy)
  def index
    @todos = Todo.where(user: current_user).order(created_at: :desc)
  end

  def show
  end

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

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @todo.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :description).merge(user_id: current_user.id)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
