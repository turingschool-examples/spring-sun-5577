class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end 

  def destroy
    doc_id = params[:id].to_i
    pat_id = params[:patient_id].to_i
    @doctor = Doctor.find(doc_id)
    DoctorPatient.destroy(pat_id)
    redirect_to "/doctors/#{@doctor.id}"
  end
  

end 