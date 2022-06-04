class Group < ApplicationRecord
  has_many :children, dependent: :destroy
 
end
