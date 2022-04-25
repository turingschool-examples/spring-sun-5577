class DoctorPatientsController < ApplicationController
  def destroy
    doc_pat = DoctorPatient.find(params[:id])
    doc_pat.destroy

    redirect_to doctor_path(doc_pat.doctor)
  end
end
