class PatientDoctorsController < ApplicationController

  def delete
    record = PatientDoctor
    .where(doctor_id: params[:doctor_id])
    .where(patient_id: params[:patient_id])
    PatientDoctor.destroy(record.first.id)
    redirect_to "/doctors/#{params[:doctor_id]}/"
  end

end
