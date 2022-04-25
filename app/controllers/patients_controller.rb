class PatientsController < ApplicationController
  def index
    @patients = Patient.old_to_young
  end
end
