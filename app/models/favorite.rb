class Favorite < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :game
  
  validates_uniqueness_of :game_id, scope: :customer_id #[:customer_id, :admin_id] ←adminが設定される場合はこれを有効にする

end
