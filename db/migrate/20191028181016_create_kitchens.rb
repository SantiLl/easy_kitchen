class CreateKitchens < ActiveRecord::Migration[5.2]
  def change
    create_table :kitchens do |t|
      t.string :address
      t.string :description

      t.timestamps
    end
  end
end
