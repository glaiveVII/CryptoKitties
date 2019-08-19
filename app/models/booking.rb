class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :kitty
  validates :end_date, presence: true
  validates :start_date, presence: true
  validates :price, presence: true
  validates :kitty_id, presence: true
  validates :user_id, presence: true
end
