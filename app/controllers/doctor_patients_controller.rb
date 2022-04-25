class DoctorPatientsController < ApplicationController
  def update
    # require 'pry'; binding.pry
    doctor = Patient.find(params[:id]).doctors.first
    relationship = DoctorPatient.where(patient_id: params[:id]).first.id
    DoctorPatient.destroy(relationship)
    redirect_to "/doctors/#{doctor.id}"
  end
end
