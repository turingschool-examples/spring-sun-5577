class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    doctor.doctor_patients.find_by(patient_id: params[:id]).destroy
    redirect_to doctor_path(doctor.id)
  end
end
