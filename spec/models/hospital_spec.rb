require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe "methods" do
    it "finds a list of universities" do
      @hospital = Hospital.create!(name: "Denver Health")

      @doctor2 = @hospital.doctors.create!(name: "Sheldon Cooper", specialty: "Hearts", university: "Maine University")
      @doctor3 = @hospital.doctors.create!(name: "Paige Hallowell", specialty: "Eyes", university: "Metro State")
      @doctor1 = @hospital.doctors.create!(name: "Alex Trebek", specialty: "Feet", university: "Florida State")
      @doctor4 = @hospital.doctors.create!(name: "Prue Hallowell", specialty: "Cancer", university: "Metro State")

      expect(@hospital.list_of_uni.count).to eq(3)
    end
  end
end
