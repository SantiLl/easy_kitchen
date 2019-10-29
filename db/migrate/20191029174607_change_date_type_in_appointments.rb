class ChangeDateTypeInAppointments < ActiveRecord::Migration[5.2]
  def change
    change_column :appointments, :date, :string
  end
end
