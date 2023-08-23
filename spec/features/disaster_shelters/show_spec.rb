require 'rails_helper'

RSpec.describe "Disaster Shelter Show", type: :feature do
  describe "2. As a visitor" do
    describe "when I visit '/parents/:id" do
      it "then I see the parent with that id including the parent's attributes" do

        arlington_life = DisasterShelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = DisasterShelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25) 
        visit "/disaster_shelters/#{arlington_life.id}"

        expect(page).to have_content(arlington_life.shelter_name)
        expect(page).to have_content("Address: #{arlington_life.address}")
        expect(page).to have_content("Case Management Available: #{arlington_life.case_management_available}")
        expect(page).to have_content("Capasity: #{arlington_life.capasity}")
      end
      
    end
  end
end