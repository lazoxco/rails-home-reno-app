class ItemsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @item = @task.items.create(item_params)

    if @item.save
      redirect_to task_path(@task)
    else
      @item
    end
  end

  def update 
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:task_id])
      @item = @task.items.find(params[:id])
      @item.destroy
      redirect_to task_path(@task)
  end

  private

  def item_params
    params.require(:item).permit(:name, :status)
  end
end
