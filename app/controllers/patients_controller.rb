class PatientsController < ApplicationController
  def index
    @patients = Patient.age_order
  end
end
