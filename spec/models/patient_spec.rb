require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe "methods" do
    before :each do
      @patient1 = Patient.create!(name: "Thor", age: "21")
      @patient2 = Patient.create!(name: "Apollo", age: "18")
      @patient3 = Patient.create!(name: "Ian", age: "19")
      @patient4 = Patient.create!(name: "Pabu", age: "30")
    end

    it 'orders youngest to oldest' do
      expect(Patient.all.old_to_young).to eq([@patient4, @patient1, @patient3, @patient2])
    end
  end
end
