class DoctorsController < ApplicationController

  def show
      @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    @doctor.remove_patient(params[:name])
    @doctor.save
    redirect_to "/doctors/#{@doctor.id}"
  end
end
