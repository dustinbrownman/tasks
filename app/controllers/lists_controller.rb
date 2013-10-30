class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "Woohoo! A list!"
      redirect_to lists_path
    else
      @lists = List.all
      render :index
    end
  end

  def show
    @list = List.find(params[:id])
    @task = @list.tasks.new
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
end
