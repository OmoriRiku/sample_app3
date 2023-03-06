class ListsController < ApplicationController
  
  def new
    @list = List.new
  end
  
  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "投稿しました"
      redirect_to lists_path
    else
      render :new
    end
  end
  
  def index
    @list = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:notice] = "更新しました"
      redirect_to show_list_path(@list)
    else
      render :edit
    end
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    flash[:notice] = "削除しました。"
    redirect_to lists_path
  end
  
  private
  
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
  
end
