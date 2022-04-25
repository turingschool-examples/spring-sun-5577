require 'rails_helper'

RSpec.describe 'the patient index spec' do
 xit 'shows all patients names from oldest to youngest' do
   hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
   bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
   mcdreamy = hospital.doctors.create!(name: "Patrick Dempsy", specialty: "Brains", university: "Oregon State University")
   ploppy= hospital.doctors.create!(name: "Ploppy Gutcutter", specialty: "Gore", university: "Power Butcher University")
   duke = hospital.doctors.create!(name: "Duke Gutcutter", specialty: "Gore", university: "Oregon State University")
   patient2 = bailey.patients.create!(name:"Drew", age:27)
   patient3 = mcdreamy.patients.create!(name:"Patty", age:69)
   patient1 = bailey.patients.create!(name:"Daver", age:37)
   visit "patients"

    within "#patients" do
      expect(patient2.name).to appear_before(patient1.name)
      expect(patient1.name).to appear_before(patient3.name)
    end
  end
end
