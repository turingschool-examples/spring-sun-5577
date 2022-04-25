class PatientsController < ApplicationController
  def index
    @patients = Patient.age_before_beauty
  end

  def show
    @patient = Patient.find(params[:id])
  end
end
