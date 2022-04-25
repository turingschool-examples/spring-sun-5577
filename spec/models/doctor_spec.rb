require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to(:hospital) }
    it { should have_many(:patients) }
  end

  describe "methods" do
    xit "finds a list of universities" do
      @hospital = Hospital.create!(name: "Denver Health")

      @doctor2 = @hospital.doctors.create!(name: "Sheldon Cooper", specialty: "Hearts", university: "Maine University")
      @doctor3 = @hospital.doctors.create!(name: "Paige Hallowell", specialty: "Eyes", university: "Metro State")
      @doctor1 = @hospital.doctors.create!(name: "Alex Trebek", specialty: "Feet", university: "Florida State")
      @doctor4 = @hospital.doctors.create!(name: "Prue Hallowell", specialty: "Cancer", university: "Metro State")

      expect(@hospital.doctors.list_of_uni).to eq([@doctor1.university, @doctor2.university, @doctor3.university])
    end
  end
end
