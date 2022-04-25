require 'rails_helper'

RSpec.describe 'Patients Index Page', type: :feature do
  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital1 = Hospital.create!(name: "Not my Hospital")
    @doc = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doc1 = @hospital.doctors.create!(name: "Paul", specialty: "General Surgery", university: "Webster University")
    @doc2 = @hospital1.doctors.create!(name: "John", specialty: "Internal Med", university: "Colorado University")
    @denny = @doc.patients.create!(name: "Denny Duquette", age: 39)
    @john = @doc.patients.create!(name: "John", age: 49)
    @ringo = @doc1.patients.create!(name: "Ringo", age: 70)
  end

  it 'Displays all Patients' do
    visit patients_path

    expect(@ringo.name).to appear_before(@john.name)
    expect(@john.name).to appear_before(@denny.name)

  end
end
