class DoctorPatientsController < ApplicationController
  def destroy
    doc_pat = DoctorPatient.find(params[:id])
    doctor_id = doc_pat.doctor_id
    doc_pat.destroy

    redirect_to "/doctors/#{doctor_id}"
  end
end
