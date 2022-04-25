class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    hospital = doctor.hospital
    doctor_patient = DoctorPatient.find_by(doctor_id: params[:doctor_id], patient_id: params[:patient_id])
    doctor_patient.destroy
    redirect_to "/hospitals/#{hospital.id}/doctors/#{doctor.id}"
  end
end