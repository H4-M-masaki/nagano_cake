class Public::DeliveriesController < ApplicationController
  def index
    @customer = Customer.new
    @customers = Customer.all
  end

  def edit
    @customer = current_customer
  end
  
  def create
  end
  
  
  private
  
  
  def customer_params
    params.require(:customer).permit(:name,:address,:postal_code)
  end
end
