class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
    # hospital = Hospital.where(hospital_id: params[:id])
  end
end
