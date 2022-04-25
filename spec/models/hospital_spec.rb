require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'instance methods' do
    before do
      @hospital1 = Hospital.create!(name: "Grey Sloan Memorial")
      @hospital2 = Hospital.create!(name: "Nothing Hospy")

      @doc1 = @hospital1.doctors.create!(name:"Meredith Grey", specialty: "General Surgery", university: "Dartmouth")
      @doc2 = @hospital1.doctors.create!(name:"Alex Karev", specialty: "Pediatrics", university: "School U")
      @doc3 = @hospital1.doctors.create!(name:"Jo Karev", specialty: "Brain Surgery", university: "School U")

      @doc4 = @hospital2.doctors.create!(name:"Hospy Docty", specialty: "Not Anything", university: "Uncool U")
    end
    it "#doctor_unis selects unique list of doctors universitys" do
      actual = @hospital1.doctor_unis.map do |doc|
        doc.university
      end
      expect(actual).to eq(["Dartmouth", "School U"])
    end
  end
end
