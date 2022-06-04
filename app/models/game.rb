class Game < ApplicationRecord
  has_one_attached :image
  

     # イメージが登録されなかった場合、デフォルトの画像をアタッチする
  def get_image
    self.image.attached? ? image : 'no_image.png'
  end

end
