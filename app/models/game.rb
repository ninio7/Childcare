class Game < ApplicationRecord
  has_many_attached :images

  belongs_to :customer, optional: true
  belongs_to :admin, optional: true
  has_many :favorites, dependent: :destroy
  has_many :game_tags, dependent: :destroy
  has_many :tags, through: :game_tags

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  scope :latest, -> {order(created_at: :desc)}
  scope :favorite, -> { includes(:favorites).sort {|a,b| b.favorites.size <=> a.favorites.size}}


     # イメージが登録されなかった場合、デフォルトの画像をアタッチする
  def get_image
    self.image.attached? ? image : 'no_image.png'
  end

  def save_tags(savegame_tags)
    # 現在のユーザーの持っているskillを引っ張ってきている
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 今gameが持っているタグと今回保存されたものの差をすでにあるタグとする。古いタグは消す。
    old_tags = current_tags - savegame_tags
    # 今回保存されたものと現在の差を新しいタグとする。新しいタグは保存
    new_tags = savegame_tags - current_tags
		
    # Destroy old taggings:
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end
		
    # Create new taggings:
    new_tags.each do |new_name|
      game_tag = Tag.find_or_create_by(name:new_name)
      # 配列に保存
      self.tags << game_tag
    end
  end
end
