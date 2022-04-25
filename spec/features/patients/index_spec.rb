require 'rails_helper' 

RSpec.describe "Patient index page" do 

    it 'displays the patients by age' do 
        patient1 = Patient.create!(name: "Becky", age: 17)
        patient2 = Patient.create!(name: "Bruce", age: 32)
        patient3 = Patient.create!(name: "Rod", age: 43)
        patient4 = Patient.create!(name: "Rick", age: 25)

        visit'/patients'
        expect("Rod").to appear_before("Becky")
    end
end