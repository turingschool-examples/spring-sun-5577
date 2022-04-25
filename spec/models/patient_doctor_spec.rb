require 'rails_helper'

RSpec.describe PatientDoctor do
  describe 'relationships' do
    it { should belong_to(:patient) }
    it { should belong_to(:doctor) }
  end
end
