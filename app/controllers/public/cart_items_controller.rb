class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @customer = current_customer
    @cart_item = CartItem.new
    @total = 0
  end
  
  def create
   @cart_item = CartItem.new(cart_item_params)
   @cart_item.customer_id = current_customer.id
   @cart_items = current_customer.cart_items
   @cart_items.each do |cart_item|
     if  @cart_item.item_id == cart_item.item_id
         cart_item.update(amount: @cart_item.amount + cart_item.amount)
         @cart_item.delete
     end
   end
   if @cart_item
       @cart_item.save
   end
   redirect_to public_cart_items_path

  end
  
  def destroy
   @cart_items = CartItem.find(params[:id])
   @cart_items.destroy
   redirect_to public_cart_items_path
  end
  
  def update
      @cart_items = CartItem.find(params[:id])
    if @cart_items.update(cart_item_params)
      redirect_to public_cart_items_path
    end
  end  
  
  
  
  
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

  
end
