class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :children, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :absents, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :games, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  validates :name, presence: true
  validates :kana_name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end
