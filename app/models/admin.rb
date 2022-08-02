class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contacts, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :games, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :annual_plans, dependent: :destroy
  has_many :persona_plans, dependent: :destroy

end
