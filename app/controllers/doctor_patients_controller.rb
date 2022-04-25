class DoctorPatientsController < ApplicationController
  def destroy
    dp = DoctorPatient.find_by_patient_id(params[:patient_id])
    dp.destroy
    redirect_to doctor_path(params[:doctor_id])
  end
end
