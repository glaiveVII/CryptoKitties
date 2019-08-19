class Kitty < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :public_key, presence: true
  validates :price, presence: true
  validates :user_owner_id, presence: true

end
