class Public::ItemsController < ApplicationController
  def index
   @items = Product.all
   @genres = Genre.all
  end

  def show
   @item = Product.find(params[:id])
   @cart_item = CartItem.new
  end
  
  
  private
  
  def item_params
    params.require(:item).permit(:genre_id, :name, :image_id, :introduction, :price, :is_active)
  end
  
end
