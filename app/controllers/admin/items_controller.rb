class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    end
  end
  
  
  def update
   @item = Item.find(params[:id])
   if @item.update(item_params)
     redirect_to admin_item_path
   end
  end
  

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  
  private
  
  def item_params
    params.require(:item).permit(:genre_id, :name, :image_id, :introduction, :price, :is_active)
  end
  
end

  

