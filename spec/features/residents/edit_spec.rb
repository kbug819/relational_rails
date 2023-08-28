require 'rails_helper'

RSpec.describe "Resident Show", type: :feature do
  describe "18 As a visitor" do
    describe "I can visit the resident index page and see an edit button next to each resident" do
      it "the button will take the me to the edit page for that shelter" do
        arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
        jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")
        visit "/residents/#{jones.id}/edit"
        expect(page).to have_content("Family Name")
        expect(page).to have_content("Family Size")
        fill_in('family_name', with: "Test1")
        fill_in('long_term_housing_need', with: "true")
        fill_in('family_size', with: "3")
        click_button('Update Resident Record')
        expect(page).to have_content("Test1")
        expect(page).to have_content("Long Term Housing Need: true")
        expect(page).to have_content("Family Size: 3")
      end
    end
  end


end