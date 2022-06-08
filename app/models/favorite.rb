class Favorite < ApplicationRecord
belongs_to :customer, optional: true
# belongs_to :admin, optional: true
belongs_to :game
validates_uniqueness_of :game_id, scope: :customer_id
validates_uniqueness_of :game_id, scope: :admin_id

end
