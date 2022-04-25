require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end
  describe 'instance methods' do 
    describe '.unique_universities' do 
      it 'returns a unique list of universities that doctors of a hospital attended' do 
        hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
        bailey = hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
        christina = hospital1.doctors.create!(name: "Cristina Yang", specialty: "Cardiothoracic Surgery", university: "Stanford University")
        alex = hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "University of Iowa")

        expect(hospital1.unique_universities).to eq(["Stanford University", "University of Iowa"])
      end
    end
  end
end
