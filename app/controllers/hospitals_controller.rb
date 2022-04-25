class HospitalsController < ApplicationController

  def show
    @hospital = Hospital.find(params[:id])
    binding.pry
  end

end
