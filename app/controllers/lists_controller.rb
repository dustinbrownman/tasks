class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @task = @list.tasks.new
    @tasks_complete = @list.tasks.where(complete: true)
    @tasks_not_complete = @list.tasks.where(complete: false)
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "Woohoo! A list!"
      redirect_to lists_path
    else
      render :index
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:notice] = "DELETED!"
    redirect_to lists_path
  end

private

  def list_params
    params.require(:list).permit(:name)
  end

  def task_params
    params.require(:task).permit(:name, :list_id)
  end
end