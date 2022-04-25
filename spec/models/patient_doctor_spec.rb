require 'rails_helper'

RSpec.describe PatientDoctor, type: :model do
 it {belong_to :patient}
 it {belong_to :doctor}
end
