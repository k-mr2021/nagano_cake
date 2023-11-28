class Item < ApplicationRecord
  #画像を投稿できるようにする   
  has_one_attached :image
  belongs_to :genre
  
  def get_image
    imag
  end
  
end



