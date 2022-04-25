class PatientsController < ApplicationController

  def index
    @patients = Patient.sort_all_by_age
  end
end