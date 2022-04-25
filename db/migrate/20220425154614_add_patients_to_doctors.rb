class AddPatientsToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_reference :doctors, :patients, foreign_key: true
  end
end
