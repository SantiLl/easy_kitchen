class AddAppointmentToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :appointment, foreign_key: true
  end
end
