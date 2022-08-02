class Child < ApplicationRecord
  belongs_to :customer
  belongs_to :group
  has_many :persona_plans, dependent: :destroy

  validates :name, presence: true
  validates :kana_name, presence: true
  validates :birthday, presence: true



end
