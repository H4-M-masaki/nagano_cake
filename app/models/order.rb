class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_details
  
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  
  def subtotal
    item.with_tax_price * amount
  end
  
  def delivery_display
      '〒' + postal_code + ' ' + address + ' ' + name
  end
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4 }
  
end
