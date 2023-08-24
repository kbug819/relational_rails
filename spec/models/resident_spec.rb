require 'rails_helper'

RSpec.describe Resident do
  
  describe 'relationships' do
    it {should belong_to :shelter}
  end
end