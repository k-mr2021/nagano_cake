class Order < ApplicationRecord
  # 支払方法
  enum payment_method: { credit_card: 0, transfer: 1}
  
  # アソシエーション
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
end

