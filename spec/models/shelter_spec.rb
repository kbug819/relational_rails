require 'rails_helper'

RSpec.describe Shelter, type: :model do
  # describe "validations" do
  #   it { should validate_presence_of :shelter_name }
  # end

  describe 'relationships' do
    it { should have_many :residents }
  end
  # it {should have_many :residents}


end