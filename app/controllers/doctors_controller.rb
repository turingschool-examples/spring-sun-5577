class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def destroy
    @patient = Patient.find(params[:id])
    doc_id = @patient.doctor_ids
    @patient.destroy
    redirect_to "/doctors/#{doc_id}/"
  end
end
