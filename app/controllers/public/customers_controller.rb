class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])#current_customer
    
  end

  def edit
    @customer = Customer.find(params[:id]) #current_customer
    
  end
  
  def update
  end
  
  def create
    
  end
  

  def quit
  end
  
  private
  def customer_params
  	  params.require(:customer).permit(:is_enabled, :last_name, :first_name, :last_name_kana, :first_name_kana,
  	                                   :phone_number, :email, :password, :post_code, :address)
  end
  
end
