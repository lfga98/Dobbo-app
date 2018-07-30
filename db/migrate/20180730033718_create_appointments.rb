class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :name
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
