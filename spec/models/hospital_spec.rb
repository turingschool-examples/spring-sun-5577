require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  context 'instance methods' do
    it '.number_of_doctors returns the count of associated doctors' do
      anthonys = Hospital.create!(name: "St. Anthony's")
      anthony = anthonys.doctors.create!(name: 'St. Anthony', specialty: 'Doctoring', university: 'The Doctoring University')
      tony = anthonys.doctors.create!(name: 'Regular Tony', specialty: 'Foot Surgeon', university: 'HowtoCutAFoot.com')

      d_health = Hospital.create!(name: "Denver Health")
      hank = d_health.doctors.create!(name: 'Hank', specialty: 'Doctoring', university: 'The Doctoring University')

      expect(anthonys.number_of_doctors).to be_a(Integer)
      expect(anthonys.number_of_doctors).to_not be_a(Array)
      
      expect(anthonys.number_of_doctors).to eq(2)
      expect(anthonys.number_of_doctors).to_not eq(1)
    end

    it '.unique_university_names returns a unique list of university names' do
      anthonys = Hospital.create!(name: "St. Anthony's")
      anthony = anthonys.doctors.create!(name: 'St. Anthony', specialty: 'Doctoring', university: 'The Doctoring University')
      hank = anthonys.doctors.create!(name: 'Hank', specialty: 'Pediatric Care', university: 'The Doctoring University')
      tony = anthonys.doctors.create!(name: 'Regular Tony', specialty: 'Foot Surgeon', university: 'HowtoCutAFoot.com')

      d_health = Hospital.create!(name: "Denver Health")
      phil = d_health.doctors.create!(name: 'Dr. Phil', specialty: 'Humiliation', university: 'CBS')

      expect(anthonys.unique_university_names).to be_a(Array)
      expect(anthonys.unique_university_names).to_not be_a(String)

      expect(anthonys.unique_university_names).to include('The Doctoring University', 'HowtoCutAFoot.com')
      expect(anthonys.unique_university_names).to_not include('CBS')
    end
  end
end
