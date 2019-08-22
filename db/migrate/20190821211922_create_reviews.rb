class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.references :kitty, foreign_key: true

      t.timestamps
    end
  end
end
