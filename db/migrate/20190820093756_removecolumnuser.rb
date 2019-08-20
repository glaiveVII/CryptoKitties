class Removecolumnuser < ActiveRecord::Migration[5.2]
  def change
    remove_column :kitties, :user_id , :bigint
  end
end
