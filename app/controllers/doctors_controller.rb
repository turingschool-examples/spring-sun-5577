class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
    @patients = Patient.all
  end


end
