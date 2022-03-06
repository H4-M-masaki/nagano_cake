class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    
  end

  def check
    @cart_items = current_customer.cart_items
    @total = 0
    @order = Order.new(order_params)
    @delivery = Delivery.find(params[:order][:delivery_id])
    @order.postal_code = @delivery.postal_code
    @order.address = @delivery.address
    @order.name = @delivery.name
    
  end

  def complete
  end

  def index
  end

  def show
  end
end


private

 def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
 end