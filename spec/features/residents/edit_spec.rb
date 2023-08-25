require 'rails_helper'

RSpec.describe "Resident Show", type: :feature do
  describe "14.2 when a resident's show page is visited" do
    it "shows a form to update the resident data" do
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)

      jones = Resident.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4, shelter_id: "#{arlington_life.id}")

      visit "/residents/#{jones.id}/edit"
      expect(page).to have_content("Family Name")
      expect(page).to have_content("Long Term Housing Needed")
      expect(page).to have_content("Family Size")
    end
  end


end