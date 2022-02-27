class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
    @genres = Genre.all
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product.id)
    end
  end
  
  
  def update
   @product = Product.find(params[:id])
   if @product.update(product_params)
     redirect_to admin_product_path
   end
  end
  

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  
  private
  
  def product_params
    params.require(:product).permit(:genre_id, :name, :image_id, :introduction, :price, :is_active)
  end
  
end
