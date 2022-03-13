class AddDeliveryIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :delivery_id, :integer
  end
end
