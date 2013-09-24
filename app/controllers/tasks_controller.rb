class TasksController < ApplicationController

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Yet another thing to do"
      redirect_to @task.list
    else
      @list = @task.list
      render '/lists/show'
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    flash[:notice] = "Mission Accomplished.  Well done, soldier!"
    redirect_to @task.list
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "DELETED!"
    redirect_to @task.list
  end

private

  def task_params
    params.require(:task).permit(:name, :list_id, :complete)
  end
end