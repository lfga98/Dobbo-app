class MedicalHistoriesToPatients < ActiveRecord::Migration[5.2]
  def change
      add_reference :patients, :medical_history, foreign_key: true
  end
end
