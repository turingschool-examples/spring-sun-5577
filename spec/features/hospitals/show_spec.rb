require 'rails_helper'

describe "doctor show page" do
  before do
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial")
    @hospital2 = Hospital.create!(name: "Nothing Hospy")

    @doc1 = @hospital1.doctors.create!(name:"Meredith Grey", specialty: "General Surgery", university: "Dartmouth")
    @doc2 = @hospital1.doctors.create!(name:"Alex Karev", specialty: "Pediatrics", university: "School U")
    @doc3 = @hospital1.doctors.create!(name:"Jo Karev", specialty: "Brain Surgery", university: "School U")

    @doc4 = @hospital2.doctors.create!(name:"Hospy Docty", specialty: "Not Anything", university: "Uncool U")

    visit "/hospitals/#{@hospital1.id}"
  end

  it "displays hospital name" do
    expect(page).to have_content("Grey Sloan Memorial")
    expect(page).not_to have_content("Nothing Hospy")
  end

  it "displays doctor count" do
    expect(page).to have_content("Doctors: 3")
  end

  it "displays unique list of doc universities" do
    expect(page).to have_content("Dartmouth", count: 1)
    expect(page).to have_content("School U", count: 1)

    expect(page).not_to have_content("Uncool U")
  end
end
