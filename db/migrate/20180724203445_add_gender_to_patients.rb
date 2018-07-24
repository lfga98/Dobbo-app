class AddGenderToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :gender, :string
    add_column :patients, :civil_status, :string
    add_column :patients, :scholarship, :string
    add_column :patients, :occupation, :string
    add_column :patients, :street, :string
    add_column :patients, :suburb, :string
    add_column :patients, :city, :string
    add_column :patients, :mun, :string
    add_column :patients, :county, :string
    add_column :patients, :telephone, :string
    add_column :patients, :email, :string
    add_column :patients, :reason_desc, :string
  end
end
