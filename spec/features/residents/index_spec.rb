require 'rails_helper'

RSpec.describe "Resident Index", type: :feature do
  describe "3. As a Visitor" do
    describe "when I visit /residents" do
      it "I see the name of each resident record in the system" do

        arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
        jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
        bradley = Resident.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2, shelter_id: "#{austin_street.id}")
        visit "/residents"

        expect(page).to have_content(jones.family_name)
        expect(page).to have_content(jones.long_term_housing_need)
        expect(page).to have_content(jones.family_size)
        expect(page).to have_content(jones.shelter_id)
        expect(page).to have_content(bradley.family_name)
        expect(page).to have_content(bradley.long_term_housing_need)
        expect(page).to have_content(bradley.family_size)
        expect(page).to have_content(bradley.shelter_id)
        
      end
    end
  end


end