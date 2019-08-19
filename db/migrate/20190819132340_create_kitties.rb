class CreateKitties < ActiveRecord::Migration[5.2]
  def change
    create_table :kitties do |t|
      t.string :first_name
      t.string :last_name
      t.string :public_key
      t.text :bio
      t.float :price
      t.string :breed
      t.bigint :user_owner_id
      t.boolean :available
      t.float :price_per_week
      t.string :attributes
      t.string :parents

      t.timestamps
    end
  end
end
