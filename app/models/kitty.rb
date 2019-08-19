class Kitty < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :first_name, scope: [:last_name]
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :public_key, presence: true
  validates :price, presence: true
  validates :user_owner_id, presence: true
  validates :available, presence: true, default: true
end
