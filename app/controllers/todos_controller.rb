class TodosController < ApplicationController
  before_action :logged_in_user
  before_action :set_todo, only: %i(show edit update destroy)
  def index
    @todos = Todo.where(user: current_user).order(deadline: :asc)
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

  def search
    @todos = Todo.where(user: current_user)
    @todos = @todos.where('name LIKE ?', "%#{params[:name]}%") unless params[:name].nil?
    @todos = @todos.where(status_id: params[:status_id]) unless params[:status_id] == '1'
    @todos = @todos.where(priority_id: params[:priority_id]) unless params[:priority_id] == '1'
    render :index
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :description, :deadline, :status_id, :priority_id).merge(user_id: current_user.id)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
