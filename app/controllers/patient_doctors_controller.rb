class PatientDoctorsController < ApplicationController
    def destroy
        PatientDoctor.where(patient_id: params[:patient_id], doctor_id: params[:doctor_id]).destroy_all
        redirect_to "/doctors/#{params[:doctor_id]}"
    end
end