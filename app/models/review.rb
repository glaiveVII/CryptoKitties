class Review < ApplicationRecord
  belongs_to :kitty # means, you need to add kitty_id foreign_key in the reviews table
end
