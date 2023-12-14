class OrderDetail < ApplicationRecord
  
  belongs_to :item
  belongs_to :order
  
  # 小計
  def subtotal
    item.with_tax_price * amount
  end
  
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
  
  
end






