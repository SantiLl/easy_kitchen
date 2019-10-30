class AddFieldsToKitchen < ActiveRecord::Migration[5.2]
  def change
    add_column :kitchens, :photo, :string
    add_column :kitchens, :name, :string
    add_column :kitchens, :price, :integer
    add_column :kitchens, :latitude, :float
    add_column :kitchens, :longitude, :float
  end
end
