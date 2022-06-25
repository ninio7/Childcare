class Group < ApplicationRecord
  has_many :children, dependent: :destroy
  has_many :customers, through: :children
  has_many :newses, dependent: :destroy
 validates :name, presence: true, uniqueness: true

end
