class AddUserIdToKitchens < ActiveRecord::Migration[5.2]
  def change
    add_reference :kitchens, :user, foreign_key: true
  end
end
