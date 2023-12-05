class Address < ApplicationRecord
  
  # アソシエーション
  belongs_to :customer
  
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
  
  enum select_address: { current_address: 0, registered_address: 1, new_address: 2}
  
end





