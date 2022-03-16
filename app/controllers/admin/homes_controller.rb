class Admin::HomesController < ApplicationController
  
  skip_before_action :authenticate_customer!
  
  def top
    @orders = Order.all
  end
end
