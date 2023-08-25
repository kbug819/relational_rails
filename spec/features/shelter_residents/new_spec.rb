require 'rails_helper'

RSpec.describe "Disaster Shelter Resident Index", type: :feature do
  describe "13 As a visitor" do
    it "from the list of residents at each shelter, we can add an associated record" do
        arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25)
        jones = arlington_life.residents.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4)
        bradley = austin_street.residents.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2) 
        
        visit "/shelters/#{arlington_life.id}/residents/new"
        expect(page).to have_content("Family Name")
        expect(page).to have_content("Long Term Housing Needed")
        expect(page).to have_content("Family Size")
      end
    end
  end