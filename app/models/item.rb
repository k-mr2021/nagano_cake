class Item < ApplicationRecord
  #画像を投稿できるようにする   
  has_one_attached :image
  
  def get_image
    imag
  end
  
  # 単価(税込み金額)
  def with_tax_price
    (price * 1.1).floor
  end
  
  # アソシエーション
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  
end



