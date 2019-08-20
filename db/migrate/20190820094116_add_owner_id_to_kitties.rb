class AddOwnerIdToKitties < ActiveRecord::Migration[5.2]
  def change
    add_reference :kitties, :owner, foreign_key: {to_table: :users}, index: true
  end
end
