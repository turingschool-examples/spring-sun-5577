class PatientDoctorsController < ApplicationController
  def destroy
    pat_doc = PatientDoctor.find(params[:id])
    pat_doc.destroy
    redirect_to doctor_path(params[:doctor_id])
  end
end
