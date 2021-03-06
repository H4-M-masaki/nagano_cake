class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    
  end

  def check
    
    @cart_items = current_customer.cart_items
    @total = 0
    @order = Order.new(order_params)
    #binding.pry
    @order.postage = 800
    @order.billing_amount = @total 
    @order_details = OrderDetail.new
    if params[:order][:delivery_option] == '0'
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name
    elsif params[:order][:delivery_option] == '1'
      @delivery = Delivery.find(params[:order][:delivery_id])
      @order.postal_code = @delivery.postal_code
      @order.address = @delivery.address
      @order.name = @delivery.name
    elsif params[:order][:delivery_option] == '2'
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end
  
  def create
    @total = 0
    @cart_items = current_customer.cart_items
    
    @order = Order.new(order_params)
    if @order.save
      @cart_items.each do |cart_item|
        order_detail = @order.order_details.new
        order_detail.item_id = cart_item.item_id
        order_detail.amount = cart_item.amount
        order_detail.tax_included_price = cart_item.item.price * 1.1.floor
        order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to public_orders_complete_path
    end
  end
  
  def complete
  end
  


  def index
    @orders = current_customer.orders
    @customer = current_customer
  end

  def show
    @order = Order.find(params[:id])
    
  end



private

 def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :delivery_id, :customer_id, :billing_amount, :order_status )
 end
 
  

end
 