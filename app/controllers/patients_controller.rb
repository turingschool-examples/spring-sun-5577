class PatientsController < ApplicationController
  def index
    @patients = Patient.age_before_beauty
  end
end
