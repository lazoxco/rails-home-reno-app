class CommentsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to task_path(@task)
    else
      flash.now[:danger] = "error"
    end
  end

  def destroy
    @task = Task.find(params[:task_id])
      @comment = @task.comments.find(params[:id])
      @comment.destroy
      redirect_to task_path(@task)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
