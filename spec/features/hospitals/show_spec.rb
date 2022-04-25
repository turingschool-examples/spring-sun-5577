require 'rails_helper'

RSpec.describe 'hospitals show page' do
  describe 'as a user' do
    describe 'when i visit a hospitals show page' do
      before :each do
        @hospital_1 = Hospital.create!(name: "Denver Hospital")
        @hospital_2 = Hospital.create!(name: "DC Hospital")
        @doctor_1 = @hospital_1.doctors.create!(name: "Something Kennedy", specialty: "Cancer", university: "VCU")
        @doctor_2 = @hospital_1.doctors.create!(name: "Bill Notadoctor", specialty: "Gastrointestinal", university: "NYU")
        @doctor_3 = @hospital_1.doctors.create!(name: "Brian Definitelynotadoctor", specialty: "Sports injuries", university: "Johns Hopkins")
        @doctor_4 = @hospital_1.doctors.create!(name: "Dr. Strangelove", specialty: "Nuclear Winter", university: "Johns Hopkins")
        @doctor_5 = @hospital_1.doctors.create!(name: "Dr. Evil", specialty: "Evil", university: "VCU")
        @doctor_5 = @hospital_2.doctors.create!(name: "Another Doctor", specialty: "Doctoring", university: "Harvard")
        @doctor_5 = @hospital_2.doctors.create!(name: "YetAnother Doctor", specialty: "More specific doctoring", university: "Yale")

        visit "/hospitals/#{@hospital_1.id}"
      end

      it 'i see the hospital name' do
        expect(page).to have_content("Denver Hospital")
        expect(page).not_to have_content("DC Hospital")
      end

      it 'and i see the number of doctors that work at this hospital' do
        expect(page).to have_content("Number of Doctors at this Hospital: 5")
      end

      it 'and i see a unique list of universities that this hospitals doctors attended' do
        expect(page).to have_content("VCU").once
        expect(page).to have_content("NYU").once
        expect(page).to have_content("Johns Hopkins").once
        expect(page).not_to have_content("Harvard")
        expect(page).not_to have_content("Yale")
      end
    end
  end
end
