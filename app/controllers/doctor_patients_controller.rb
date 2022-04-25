class DoctorPatientsController < ApplicationController

  def destroy
    doctor = Doctor.find(params[:id])
    doc_patient= DoctorPatient.find(params[:doc_patient_id])
    doc_patient.destroy
    
    redirect_to(doctor_path)
    # redirect_to "/doctors/#{doctor.id}"
  end 

end 