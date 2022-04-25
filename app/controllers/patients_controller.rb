class PatientsController < ApplicationController
  def index
    @patients = Patient.all.old_to_young
  end

  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:id])

    @doctor.patients.delete(@patient)

    redirect_to "/doctor/#{@doctor.id}"
  end
end
