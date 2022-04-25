class DoctorPatientsController < ApplicationController
  def destroy
    @doctor_id = DoctorPatient.find(params[:id]).doctor_id
    @doctor_patient = DoctorPatient.find(params[:id])
    @doctor_patient.destroy
    redirect_to "/doctors/#{@doctor_id}"
  end
end
