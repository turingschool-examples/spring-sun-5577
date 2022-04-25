class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    doctor.doctor_patients.find(params[:patient_id]).destroy
    redirect_to "/doctors/#{doctor.id}"
  end
end
