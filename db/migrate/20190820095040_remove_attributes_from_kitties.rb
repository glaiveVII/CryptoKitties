class RemoveAttributesFromKitties < ActiveRecord::Migration[5.2]
  def change
    remove_column :kitties, :attributes , :string
  end
end
