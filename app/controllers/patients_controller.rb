class PatientsController < ApplicationController
  def index 
      @patients = Patient.order_by_age_desc
  end 
end