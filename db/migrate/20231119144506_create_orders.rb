class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      #enumを使用 credit:1,クレジットカード , bank:2,銀行振込
      t.integer :payment_method, null: false
      t.integer :billing_amount, null: false
      t.integer :postage, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :select_address, null: false
      t.timestamps
    end
  end
end







