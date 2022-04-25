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

      expect(anthonys).number_of_doctors.to be_a(Integer)
      expect(anthonys.number_of_doctors).to eq(2)
      expect(anthonys.number_of_doctors).to_not eq(1)
    end
  end
end
