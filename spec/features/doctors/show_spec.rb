require 'rails_helper'

RSpec.describe "Doctor Show Page" do
  describe 'When I visit the doctors show page' do
    it 'I see all of that doctors information including name, specialty, university' do
      hosp = Hospital.create!(name: 'Grace')

      doc1 = hosp.doctors.create!(name: 'John', specialty: 'general', university: 'top u')
      doc2 = hosp.doctors.create!(name: 'Jim', specialty: 'heart', university: 'bottom u')

      visit doctor_path(doc1.id)

      expect(page).to have_content(doc1.name)
      expect(page).to have_content(doc1.specialty)
      expect(page).to have_content(doc1.university)
      expect(page).to_not have_content(doc2.name)
      expect(page).to_not have_content(doc2.specialty)
      expect(page).to_not have_content(doc2.university)
    end

    it 'I see the name of the hospital where this doctor works' do
      hosp = Hospital.create!(name: 'Grace')
      hosp2 = Hospital.create!(name: 'Mercy')

      doc1 = hosp.doctors.create!(name: 'John', specialty: 'general', university: 'top u')
      doc2 = hosp2.doctors.create!(name: 'Jim', specialty: 'heart', university: 'bottom u')

      visit doctor_path(doc1.id)

      expect(page).to have_content(hosp.name)
      expect(page).to_not have_content(hosp2.name)
    end

    it 'I see the names of all of the patients this doctor has' do
      hosp = Hospital.create!(name: 'Grace')

      doc1 = hosp.doctors.create!(name: 'Jane', specialty: 'general', university: 'top u')
      doc2 = hosp.doctors.create!(name: 'Mina', specialty: 'heart', university: 'bottom u')

      pat1 = Patient.create!(name: 'Sarah', age: 30)
      pat2 = Patient.create!(name: 'Joe', age: 20)
      pat3 = Patient.create!(name: 'Gene', age: 40)

      docp1 = DoctorPatient.create!(doctor: doc1, patient: pat1)
      docp1 = DoctorPatient.create!(doctor: doc1, patient: pat3)
      docp1 = DoctorPatient.create!(doctor: doc2, patient: pat2)

      visit doctor_path(doc1.id)

      expect(page).to have_content(pat1.name)
      expect(page).to have_content(pat3.name)
      expect(page).to_not have_content(pat2.name)
    end
  end
end