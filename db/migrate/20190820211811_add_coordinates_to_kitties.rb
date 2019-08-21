class AddCoordinatesToKitties < ActiveRecord::Migration[5.2]
  def change
    add_column :kitties, :latitude, :float
    add_column :kitties, :longitude, :float
  end
end
