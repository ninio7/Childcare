class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :children, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :absence_notifications, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :games, dependent: :destroy
end
