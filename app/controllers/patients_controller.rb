class PatientsController < ApplicationController
  def index
    @patients = Patient.oldest_to_youngest
  end
end
