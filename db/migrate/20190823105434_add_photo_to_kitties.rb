class AddPhotoToKitties < ActiveRecord::Migration[5.2]
  def change
    add_column :kitties, :photo, :string
  end
end
