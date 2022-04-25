class DoctorPatientsController < ApplicationController
  def destroy
    doctor_patient = DoctorPatient.find(params[:id])
    DoctorPatient.destroy(doctor_patient.id)
    redirect_to doctor_path(doctor_patient.doctor.id)
  end
end
