class Group < ApplicationRecord
  has_many :children, dependent: :destroy
  has_many :customers, through: :children
  has_many :news_groups, dependent: :destroy, foreign_key: 'group_id'
  has_many :news, through: :news_groups
  has_many :personal_plans, dependent: :destroy
  has_many :annual_plans, dependent: :destroy
  has_many :weekly_plans, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :age, presence: true, uniqueness: true
end
