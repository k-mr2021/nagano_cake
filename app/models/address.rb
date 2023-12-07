class Address < ApplicationRecord
  
  # アソシエーション
  belongs_to :customer
  
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
  
  # 自身の住所:0, 登録済住所:1, 新規住所:2
  enum select_address: { current_address: 0, registered_address: 1, new_address: 2}
  
end





