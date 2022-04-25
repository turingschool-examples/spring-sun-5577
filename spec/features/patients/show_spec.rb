require 'rails_helper'

RSpec.describe "patients index page", type: :feature do
  it 'has all the patients listed from oldest to youngest' do
    hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    hospital2 = Hospital.create!(name: "Mercy West")

    bailey = hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    alex = hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatrics", university: "Iowa State")

    april = hospital2.doctors.create!(name: "April Kepner", specialty: "Trauma", university: "Boston University")
    avery = hospital2.doctors.create!(name: "Jackson Avery", specialty: "Plastics", university: "Stanford University")

    kimmy = Patient.create!(name: "Kimmy", age: 14)
    frank = Patient.create!(name: "Frank", age: 45)
    nick = Patient.create!(name: "Nick", age: 8)
    amy = Patient.create!(name: "Amy", age: 43)
    subia = Patient.create!(name: "Subia", age: 34)
    joe = Patient.create!(name: "Joe", age: 52)

    PatientDoctor.create!(doctor: bailey, patient: kimmy)
    PatientDoctor.create!(doctor: alex, patient: kimmy)
    PatientDoctor.create!(doctor: alex, patient: frank)
    PatientDoctor.create!(doctor: bailey, patient: nick)

    PatientDoctor.create!(doctor: april, patient: amy)
    PatientDoctor.create!(doctor: april, patient: subia)
    PatientDoctor.create!(doctor: april, patient: joe)
    PatientDoctor.create!(doctor: avery, patient: joe)
    PatientDoctor.create!(doctor: avery, patient: amy)

    visit "/patients"
    expect(page).to have_content(amy.name, count: 1)
    expect(page).to have_content(joe.name, count: 1)
    expect(page).to have_content(kimmy.name, count: 1)

    Patient.all.each do |patient|
      expect(page).to have_content(patient.age)
      expect(page).to have_content(patient.name)
    end

    expect(joe.name).to appear_before(frank.name)
    expect(frank.name).to appear_before(amy.name)
    expect(amy.name).to appear_before(subia.name)
    expect(subia.name).to appear_before(kimmy.name)
    expect(kimmy.name).to appear_before(nick.name)
  end
end
