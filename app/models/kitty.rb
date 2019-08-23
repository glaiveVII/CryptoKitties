class Kitty < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings, dependent: :destroy
  has_many :reviews

  validates_uniqueness_of :first_name, scope: [:last_name]
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  mount_uploader :photo, PhotoUploader

  validates :price, presence: true
  validates :public_key, presence: true
  # to simplify db i don't put this two mandatory
  # validates :available, presence: true

  #geocode gem
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
