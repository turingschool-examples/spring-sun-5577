class HospitalsDoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def destroy
    pd = PatientDoctor.find_by(patient_id: params[:patient_id], doctor_id: (params[:id]))
    pd.destroy
    redirect_to "/hospitals/doctors/#{params[:id]}"
  end
end
