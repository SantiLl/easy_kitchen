class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :user, foreign_key: true
      t.references :kitchen, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
