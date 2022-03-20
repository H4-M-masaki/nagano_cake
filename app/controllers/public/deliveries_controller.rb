class Public::DeliveriesController < ApplicationController
  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def edit
    @delivery = Delivery.find(params[:id])
    @delivery.customer = current_customer
  end
  
  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      redirect_to public_deliveries_path
    else
      @deliveries = Delivery.all
      flash[:alert] = '配送先の登録に失敗しました'
      render :index
    end
  end
  
  
  def update
       @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to public_deliveries_path(@delivery.id)
    end
  end  
  
  def destroy
   @delivery = Delivery.find(params[:id])
   @delivery.destroy
   redirect_to public_deliveries_path
  end
  
  
  private
  
  
  def delivery_params
    params.require(:delivery).permit(:name, :address, :postal_code)
  end
end
