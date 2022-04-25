class PatientsController < ApplicationController
  def destroy 
	  patient = Patient.find(params[:id])
    patient.destroy
    redirect_to doctor_path(params[:doctor_id])
  end
end