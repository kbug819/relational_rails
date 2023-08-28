require 'rails_helper'

RSpec.describe "Disaster Shelter Resident Index", type: :feature do
  describe "13 As a visitor" do
    it "from the list of residents at each shelter, we can add an associated record" do
        arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25)
        jones = arlington_life.residents.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4)
        bradley = austin_street.residents.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2) 
        
        visit "/shelters/#{arlington_life.id}/residents"
        expect(page).to have_content("Add New Associated Resident to This Shelter")
        click_link('Add New Associated Resident to This Shelter')
        expect(page).to have_content("Family Name")
        expect(page).to have_content("Long Term Housing Needed")
        expect(page).to have_content("Family Size")
        fill_in('family_name', with: "Test1")
        fill_in('long_term_housing_need', with: 'false')
        fill_in('family_size', with: '2')
        click_button('Add New Resident Record')
        expect(page).to have_content("Test1")
      end
    end
  end