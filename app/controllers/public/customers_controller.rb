class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    
  end

  def edit
    @customer = current_customer
    
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to public_customer_path
    end
  end
  
  

  def quit
   @customer = current_customer
  end
  
  
  def out
    
  end
  
  
  
  
  
  private
  def customer_params
  	  params.require(:customer).permit(:is_enabled, :last_name, :first_name, :last_name_kana, :first_name_kana,
  	                                   :phone_number, :email, :password, :post_code, :address)
  end
  
end
