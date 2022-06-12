class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :children, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :absents, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :games, dependent: :destroy
  has_many :notifications, dependent: :destroy
  #has_many :contact_contacts, dependent: :destroy, foreign_key: :customer_contact_id
  #has_many :user_contacts, through: :contact_contacts, source: 'AdminContact'
end
