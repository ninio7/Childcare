class Favorite < ApplicationRecord
belong_to :customer
belong_to :game
validates_uniqueness_of :game_id, scope: :customer_id

end
