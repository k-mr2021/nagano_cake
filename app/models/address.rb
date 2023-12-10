class Address < ApplicationRecord
  
  # アソシエーション
  belongs_to :customer
  
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
  
  
end





