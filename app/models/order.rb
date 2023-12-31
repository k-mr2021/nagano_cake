class Order < ApplicationRecord
  # 支払方法
  enum payment_method: { credit_card: 0, transfer: 1}
  
  # アソシエーション
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  # 注文に関連する注文明細が存在するかどうかを事前に確認する→NILLの場合は0を返す
  def order_detail_amount
    order_details.first&.amount || 0
  end
  
  # 自身の住所:0, 登録済住所:1, 新規住所:2
  enum select_address: { current_address: 0, registered_address: 1, new_address: 2}
  
  def total_price
    order_details.sum { |order_detail| order_detail.subtotal }
  end
  
  def full_name
     ' ' + last_name + ' ' + first_name
  end
  
end





