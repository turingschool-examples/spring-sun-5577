class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end 

  def destroy
    # # binding.pry
    # @doctor = Doctor.find(params[:id])
    # @patient = Patient.find(params[:patient_id])
    # # @doc_pat = DoctorPatient.where(patient: @patient)
    # binding.pry
    # # DoctorPatient.destroy(@patient.id)
    # @doctor.doctor_patients.destroy(params[:patient_id])
    # redirect_to "/doctors/#{@doctor.id}"
  end
  

end 