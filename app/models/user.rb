class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :kitties
  has_many :bookings

  validates :email, presence: true
  # no need of these validation otherwise you need
  # to change in view/device/registrations/new
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true, uniqueness: true
end

# Rails:
# user = User.find_by(email: 'test@gmail.com')
# user.bookings # is coming from has_many :bookings in the User model (user.rb)

# user id: 1
# bookings id: 1 user_id: 1
# bookings id: 2 user_id: 1
# bookings id: 3 user_id: 1

