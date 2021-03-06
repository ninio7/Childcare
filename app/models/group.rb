class Group < ApplicationRecord
  has_many :children, dependent: :destroy
  has_many :customers, through: :children
  has_many :news_groups, dependent: :destroy, foreign_key: 'group_id'
  has_many :news, through: :news_groups
  validates :name, presence: true, uniqueness: true

end
