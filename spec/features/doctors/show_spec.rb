require 'rails_helper'

RSpec.describe 'doctor show page' do

  before :each do
    @hospital1 = Hospital.create!(name: "St. Judes")
    @hospital2 = Hospital.create!(name: "Hospice")
    @doctor1 = @hospital1.doctors.create!(name: "Cory", specialty: "Bones", university: "Armstrong")
    @doctor2 = @hospital1.doctors.create!(name: "Sherman", specialty: "Skin", university: "Johnson")
    @doctor3 = @hospital2.doctors.create!(name: "Kim", specialty: "Cancer", university: "Xing")
    @patient1 = Patient.create!(name: "Susan", age: 10)
    @patient2 = Patient.create!(name: "Ben", age: 11)
    @patient3 = Patient.create!(name: "Alice", age: 12)
    @patient4 = Patient.create!(name: "Brittany", age: 13)
    @patient5 = Patient.create!(name: "Janice", age: 14)
    @dp1 = DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient1.id)
    @dp2 = DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient2.id)

  end

  it "displays the doctor's information" do
    visit "/doctors/#{@doctor1.id}"
    
    expect(page).to have_content(@doctor1.name)
    expect(page).to have_content(@doctor1.specialty)
    expect(page).to have_content(@doctor1.university)
    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)
    expect(page).to have_no_content(@doctor2.name)
    expect(page).to have_no_content(@doctor3.name)
    expect(page).to have_no_content(@patient3.name)
    expect(page).to have_no_content(@patient4.name)
  end



end
