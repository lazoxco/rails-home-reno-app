class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    if user_signed_in?
      @task = Task.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to task_path(@task)
    else
      @task
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
    if user_signed_in? && @task.user.id == current_user.id
      @task
    else
      redirect_to task_path(@task)
    end
  end

  def update 
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to :root
  end
  
  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
