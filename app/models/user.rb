class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :kitties
  has_many :bookings

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true, uniqueness: true
end
