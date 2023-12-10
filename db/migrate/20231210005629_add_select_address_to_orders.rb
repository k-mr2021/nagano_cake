class AddSelectAddressToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :serect_address, :string
  end
end
