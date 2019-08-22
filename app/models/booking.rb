class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :kitty

  # to simplify db i don't put date mandatory
  validates :start_date, :end_date, presence: true

  # validates :kitty_id, presence: true
  # we dont need this manual validation, we dont need this manual validation
  # this is already covered by the belongs_to :kitty
  # validates :user_id, presence: true
  # we dont need this manual validation, already covered by belongs_to :user association
end
