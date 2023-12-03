class Order < ApplicationRecord
  # 支払方法
  enum payment_method: { credit_card: 0, transfer: 1}
  
end
