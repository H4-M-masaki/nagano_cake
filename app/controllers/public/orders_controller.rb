class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def check
    @cart_items = current_customer.cart_items
    @customer = current_customer
    @cart_item = CartItem.new
    @total = 0
  end

  def complete
  end

  def index
  end

  def show
  end
end
