require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { should have_many(:doctors) }
    it { should have_many(:doctor_patients) }
    it { should have_many(:patients) }
  end

  describe 'methods' do
    before do
      @hospital_2 = Hospital.create!(name: 'Sacred Heart Hospital')
      @doctor_9 = Doctor.create!(
        name: 'J.D.',
        specialty: 'Human Connection',
        university: 'Iowa State',
        hospital_id: @hospital_2.id
      )
      @doctor_3 = Doctor.create!(
        name: 'Cox',
        specialty: 'Sarcasm',
        university: 'University of Chicago',
        hospital_id: @hospital_2.id
      )
      @doctor_6 = Doctor.create!(
        name: 'Turk',
        specialty: 'Neurogly',
        university: 'NorthWestern',
        hospital_id: @hospital_2.id
      )

      @hospital_1 = Hospital.create!(name: "Princeton - Plainsboro Teaching Hospital")
      @doctor_4 = Doctor.create!(
        name: 'House',
        specialty: 'Neurogly',
        university: 'Harvard',
        hospital_id: @hospital_1.id
      )
      @doctor_2 = Doctor.create!(
        name: 'Wilson',
        specialty: 'Parasites',
        university: 'Princeton',
        hospital_id: @hospital_1.id
      )
      @doctor_8 = Doctor.create!(
        name: 'Cuddy',
        specialty: 'Pediactrics',
        university: 'Princeton',
        hospital_id: @hospital_1.id
      )
    end

    it '.unique_universities' do
      expected = (['Harvard','Princeton'])
      expect(@hospital_1.unique_universities).to eq(expected)
    end
  end
end
