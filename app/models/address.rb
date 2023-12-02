class Address < ApplicationRecord
  
  # アソシエーション
  belongs_to :customer
  
end

