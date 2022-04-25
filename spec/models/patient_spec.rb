require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:doctors) }
    it { should have_many(:doctor_patients) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
  end

  it "lists patients from oldest to youngest" do
    mike = Patient.create!(name: "Mike Dao", age: 29)
    dani = Patient.create!(name: "Dani Coleman", age: 28)
    johnny = Patient.create!(name: "Johnny Bowman", age: 99)

    expect(Patient.old_to_young).to eq([johnny, mike, dani])
  end
end
