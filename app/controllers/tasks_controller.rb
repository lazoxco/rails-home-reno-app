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
      redirect_to :root
    else
      @task
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  
  
  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
