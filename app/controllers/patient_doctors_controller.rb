class PatientDoctorsController < ApplicationController

  def delete
    DoctorPatient
    .where(doctor_id: params[:doctor_id])
    .where(patient_id: params[:patient_id])
    .destroy
  end

end
