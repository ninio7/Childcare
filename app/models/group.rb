class Group < ApplicationRecord
  has_many :children, dependent: :destroy
  validates :name, presence: true, uniqueness: true


end
