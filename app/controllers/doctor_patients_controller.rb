class DoctorPatientsController < ApplicationController

  def destroy
    doctor_patient = DoctorPatient.find(params[:id])
    doctor_patient.destroy
    redirect_to doctor_path(params[:doctor_id])
  end
end