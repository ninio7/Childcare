class Game < ApplicationRecord
  has_many_attached :images

  belongs_to :customer, optional: true
  belongs_to :admin, optional: true
  has_many :favorites, dependent: :destroy

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  scope :latest, -> {order(created_at: :desc)}
  scope :favorite, -> { includes(:favorites).sort {|a,b| b.favorites.size <=> a.favorites.size}}
#   def favorited_by?(admin)
    # favorites.exists?(admin_id: admin.id)
#   end

     # イメージが登録されなかった場合、デフォルトの画像をアタッチする
  def get_image
    self.image.attached? ? image : 'no_image.png'
  end

end
