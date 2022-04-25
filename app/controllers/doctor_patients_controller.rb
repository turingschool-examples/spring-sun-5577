class DoctorPatientsController < ApplicationController

  def destroy
    doctor = Doctor.find(params[:id])
    DoctorPatient.find(params[:doc_patient_id]).destroy
    
    redirect_to "/doctors/#{doctor.id}"
  end 

end 