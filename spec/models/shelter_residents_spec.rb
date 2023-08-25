# require 'rails_helper'

# RSpec.describe ShelterResidents do

#   describe "#16 As a visitor, when a visitor visits the parents, children's index" do
#     xit "when a button is clicked, records are seen alphabetically" do
#       arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
#       jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
#       bradley = Resident.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2, shelter_id: "#{arlington_life.id}")
      
#       expect(ShelterResidents.order_by_alphabetical).to eq([bradley, jones])
#     end
#   end
# end