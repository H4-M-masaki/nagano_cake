class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    
  end

  def check
    @cart_items = current_customer.cart_items
    @total = 0
    @order = Order.new(order_params)
    @order.postage = 800
    @delivery = Delivery.find(params[:order][:delivery_id])
    @order.postal_code = @delivery.postal_code
    @order.address = @delivery.address
    @order.name = @delivery.name
  end
  
  def create
    @total = 0
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    if @order.save
      current_customer.cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id =  @order.id
        @order_detail.item_id = cart_item.item.id
        @order_detail.price = cart_item.item.price
        @order_detail.amount = cart_item.amount
        @order_detail.save
      end
      current_customer.cart_items.destroy_all
    end
      redirect_to public_orders_complete_path
  end
  
  def complete
  end
  


  def index
    @orders = Order.all
    
  end

  def show
  end
end


private

 def order_params
    params.require(:order).permit(:customer_id,:payment_method, :postal_code, :address, :name, :postage, :billing_amount, :order_status,)
 end