require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'instance methods' do
    it '#doctor_count' do
      hosp_1 = Hospital.create!(name: 'City Health')
      doc_1 = hosp_1.doctors.create(name: 'Jim Pfeiffer', specialty: 'Pediatrics', university: 'Vanderbilt')
      doc_2 = hosp_1.doctors.create(name: 'Ted Leftwich', specialty: 'Proctology', university: 'Emory')
      doc_3 = hosp_1.doctors.create(name: 'Corbin Meikle', specialty: 'Brain Surgery', university: 'Emory')

      expect(hosp_1.doctor_count).to eq(3)
    end

    it '#unique_univs' do
      hosp_1 = Hospital.create!(name: 'City Health')
      doc_1 = hosp_1.doctors.create(name: 'Jim Pfeiffer', specialty: 'Pediatrics', university: 'Vanderbilt')
      doc_2 = hosp_1.doctors.create(name: 'Ted Leftwich', specialty: 'Proctology', university: 'Emory')
      doc_3 = hosp_1.doctors.create(name: 'Corbin Meikle', specialty: 'Brain Surgery', university: 'Emory')

      expect(hosp_1.unique_univs).to eq(['Emory', 'Vanderbilt'])
    end
  end
end
