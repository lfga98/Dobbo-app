class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :maternal_surname
      t.numeric :age
      t.date :date_birth

      t.timestamps
    end
  end
end
