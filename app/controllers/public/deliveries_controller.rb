class Public::DeliveriesController < ApplicationController
  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def edit
    @delivery = current_customer
  end
  
  def create
    @delivery = Delivery.new
    @delivery.customer_id = current_customer.id
    if @delivery.save
      redirect_to public_deliveries_path ,notice: "新しい配送先を登録しました"
    else
      @deliveries = current_customer.deliveries.all
      flash[:alert] = '配送先の登録に失敗しました'
      render :index
    end
  end
  
  
  private
  
  
  def delivery_params
    params.require(:delivery).permit(:name,:address,:postal_code)
  end
end
