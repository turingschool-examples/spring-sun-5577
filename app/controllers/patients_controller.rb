class PatientsController < ApplicationController
  def index
    @patients = Patient.all.order(age: :desc)
  end
#  def show
#    @patient = Patient.find(params[:id])
#  end

  def destroy
    Patient.find(params[:id]).delete
    redirect_to doctor_path(params[:id])
  end

end
