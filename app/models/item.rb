class Item < ApplicationRecord
  #画像を投稿できるようにする   
  has_one_attached :image
  
  def get_image
    imag
  end
  
  # アソシエーション
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  
end



