require 'rails_helper'

RSpec.describe "Disaster Shelter resident_view filtered", type: :feature do
  describe "21. As a visitor" do
    describe "when I visit '/shelters/:id/residents" do
      it "then I see a button to filter by family size" do
        arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25)
        jones = arlington_life.residents.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4)
        bradley = austin_street.residents.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2) 
        visit "/shelters/#{arlington_life.id}/residents"
          fill_in 'family_size', with: 2
          expect(page).to have_button('submit')

        click_button 'submit'

        visit "/shelters/#{arlington_life.id}/residents/by_family_view"

        expect(page).to have_content(bradley)
        expect(page).to have_content("Long Term Housing Needed: #{bradley.long_term_housing_need}")
        expect(page).to have_content("Family Size: #{bradley.family_size}")
        expect(page).to have_content("Shelter ID: #{bradley.shelter_id}")
      end
    end
  end
end