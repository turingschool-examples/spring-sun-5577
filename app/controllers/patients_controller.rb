class PatientsController < ApplicationController
  def destroy
    @patient = Patient.find(params[:id])
  end
end
