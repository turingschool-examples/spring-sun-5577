require 'rails_helper'

describe Patient, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
  end

  describe 'relationships' do
    xit {should have_many(:doctors)}
  end
end
