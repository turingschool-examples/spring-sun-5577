class DoctorsPatientsController < ApplicationController

  #This delete call should work both ways, either with a patient being searched for a matching doctor_id association, or a doctor being searched for a matching patient_id association.
  def destroy
    patient = Patient.find(params[:id])

    patient.doctors.destroy(params[:doctor_id])

    redirect_to doctor_path(params[:doctor_id])
  end
end