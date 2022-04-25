require 'rails_helper'
RSpec.describe 'Doctors Show Page', type: :feature do
  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital1 = Hospital.create!(name: "Not my Hospital")
    @doc = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doc1 = @hospital.doctors.create!(name: "Paul", specialty: "General Surgery", university: "Webster University")
    @denny = @doc.patients.create!(name: "Denny Duquette", age: 39)
    @john = @doc.patients.create!(name: "John", age: 49)
    @ringo = @doc1.patients.create!(name: "Ringo", age: 70)
  end

  it 'Shows an individual doctor and all related attributes' do
    visit doctor_path(@doc.id)

    within("#doc-#{@doc.id}") do
      expect(page).to have_content("Name: #{@doc.name}")
      expect(page).to have_content("Specialty: #{@doc.specialty}")
      expect(page).to have_content("University: #{@doc.university}")
      expect(page).to have_content(@hospital.name)
      expect(page).to_not have_content(@hospital1.name)

      expect(page).to have_content("#{@denny.name}")
      expect(page).to have_content("#{@john.name}")
      expect(page).to_not have_content("#{@ringo.name}")
    end
  end
end
