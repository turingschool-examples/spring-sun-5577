require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:doctors) }
    it { should have_many(:doctors_patients) }
  end
end
