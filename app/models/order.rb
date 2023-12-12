class Order < ApplicationRecord
  # 支払方法
  enum payment_method: { credit_card: 0, transfer: 1}
  
  # アソシエーション
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  # 自身の住所:0, 登録済住所:1, 新規住所:2
  enum select_address: { current_address: 0, registered_address: 1, new_address: 2}
  
   def total_price
    order_details.sum { |order_detail| order_detail.subtotal }
  end
  
end




