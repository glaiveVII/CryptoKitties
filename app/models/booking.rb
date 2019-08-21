class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :kitty
  # to simplify db i don't put date mandatory
  validates :end_date, presence: true
  validates :start_date, presence: true

  # validates :price, presence: true
  validates :kitty_id, presence: true
  validates :user_id, presence: true
end
