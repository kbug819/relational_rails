# require 'rails_helper'

# RSpec.describe "Disaster Shelter resident_view", type: :feature do
#   describe "16. As a visitor" do
#     describe "when I visit '/shelters/:id/residents" do
#       it "then I see a button to sort alphabetically" do
#         arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
#         austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25)
#         jones = arlington_life.residents.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4)
#         bradley = austin_street.residents.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2) 
        
#         visit "/shelters/#{arlington_life.id}/residents/sorted_a"

#         expect(page).to have_content(jones, bradley)
#         expect(page).to have_content("Long Term Housing Needed: #{jones.long_term_housing_need}")
#         expect(page).to have_content("Family Size: #{jones.family_size}")
#         expect(page).to have_content("Shelter ID: #{jones.shelter_id}")
#       end
#     end
#   end
# end