class DoctorPatientsController < ApplicationController
  def delete
    @dp = DoctorPatient.where("patient_id = #{params[:patient]}").first.destroy
    
    redirect_to "/doctors/#{@dp.doctor_id}"
  end
end
