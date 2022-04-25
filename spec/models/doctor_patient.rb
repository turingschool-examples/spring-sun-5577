require 'rails_helper'

RSpec.describe DoctorPatient do
  describe 'relationships' do
    it {should belong_to(:doctors)}
    it {should belong_to(:patients)}
    it {should have_many(:hospitals).through(:doctor)}
  end
end
