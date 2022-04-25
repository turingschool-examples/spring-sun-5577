class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def update
    patient = Patient.find(params[:patient_id])
      patient.update(status: 1)
      redirect_to "/doctors/#{params[:id]}"
  end
end
