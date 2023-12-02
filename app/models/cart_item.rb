class CartItem < ApplicationRecord
  # アソシエーション
  belongs_to :customer
  belongs_to :item
  
end
