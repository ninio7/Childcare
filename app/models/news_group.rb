class NewsGroup < ApplicationRecord
  belongs_to :news
  belongs_to :group
  
end
