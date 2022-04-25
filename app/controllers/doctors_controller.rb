class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def destroy
    patient = DoctorPatient.find(params[:id])
    doc_id = patient.doctor_id
    patient.destroy
    redirect_to "/doctors/#{doc_id}/"
  end
end
