require 'rails_helper'

describe Doctor, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:specialty) }
    it { should validate_presence_of(:university) }
  end

  describe 'relationships' do
    it { should belong_to(:hospital) }
    it {should have_many(:patients)}
    it {should have_many(:doctor_patients)}
  end
end
