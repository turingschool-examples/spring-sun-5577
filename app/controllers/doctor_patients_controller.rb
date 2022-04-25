class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    hospital = doctor.hospital
    association = DoctorPatient.where(doctor_id: params[:doctor_id], patient_id: params[:patient_id])
    association.first.destroy
    redirect_to "/hospitals/#{hospital.id}/doctors/#{doctor.id}"
  end
end