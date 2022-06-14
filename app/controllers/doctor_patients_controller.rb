class DoctorPatientsController < ApplicationController
  def destroy
    patient = Patient.find(params[:id])
    patient.doctors.destroy(params[:doctor_id])
    redirect_to doctor_path(params[:doctor_id])
  end
end
