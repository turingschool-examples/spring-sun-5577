class PatientsController < ApplicationController
  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:id])
    
    @doctor.patients.delete(@patient)

    redirect_to "/doctor/#{@doctor.id}"
  end
end
