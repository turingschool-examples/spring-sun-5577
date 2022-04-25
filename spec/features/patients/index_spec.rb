require 'rails_helper'

RSpec.describe 'patients index page' do
  it 'displays the patients names in order from oldest to youngest' do
    pat_1 = Patient.create!(name: 'Justin Hill', age: 39)
    pat_2 = Patient.create!(name: 'Mark Gainey', age: 46)
    pat_3 = Patient.create!(name: 'Liz Hagler', age: 35)
    pat_4 = Patient.create!(name: 'Henry Mosley', age: 20)
    visit '/patients'

    expect('Mark Gainey').to appear_before('Justin Hill')
    expect('Justin Hill').to appear_before('Liz Hagler')
    expect('Liz Hagler').to appear_before('Henry Mosley')
  end
end
