class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_details
  
  def subtotal
    item.with_tax_price * amount
  end
  
  def delivery_display
      '〒' + postal_code + ' ' + address + ' ' + name
  end
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  
end
