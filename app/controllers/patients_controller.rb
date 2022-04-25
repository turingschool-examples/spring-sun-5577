class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end
  def show
    @patient = Patient.find(params[:id])
  end

  def destroy
    Patient.find(params[:id]).destroy
    redirect_to doctor_path(params[:id])
  end
end
