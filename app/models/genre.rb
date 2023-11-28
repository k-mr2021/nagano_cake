class Genre < ApplicationRecord
  # アソシエーション
  has_many :items, dependent: :destroy
end

