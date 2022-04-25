class PatientsController < ApplicationController
  def index
    @patients = Patient.sorted_by_age
  end
end
