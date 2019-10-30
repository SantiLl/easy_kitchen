class RemoveColumnFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :kitchen_id
  end
end
