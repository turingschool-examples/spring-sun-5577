require "rails_helper"

RSpec.describe "Patients Index Page" do
  before :each do
    @mike = Patient.create!(name: "Mike Dao", age: 29)
    @dani = Patient.create!(name: "Dani Coleman", age: 28)
    @johnny = Patient.create!(name: "Johnny Bowman", age: 99)
  end

  it "lists all patients from oldest to youngest" do
    visit "/patients"
    
    expect(@johnny.name).to appear_before(@mike.name)
    expect(@mike.name).to appear_before(@dani.name)
  end
end
