class HospitalsController < ApplicationController

  def show
    @hospital = Hospital.find(params[:id])
    doctors = Doctor.where(hospital_id: params[:id])
  end
end 
