class AddAddressToKitties < ActiveRecord::Migration[5.2]
  def change
    add_column :kitties, :address, :string
  end
end
