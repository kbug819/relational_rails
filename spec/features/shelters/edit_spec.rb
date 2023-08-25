
RSpec.describe "Disaster Shelter Show", type: :feature do

describe "User Story 12" do
    it "enables the user to edit, save and update a Shelter's attributs" do
      arlington_life = Shelter.create!(shelter_name: "Arlington Life Shelter", address: "lkahlsdkfh", case_management_available: true, capasity: 50)
        austin_street = Shelter.create!(shelter_name: "Austin Street Shelter", address: "lkahlsdkfh", case_management_available: false, capasity: 25)
        jones = arlington_life.residents.create!(family_name: "Jones", long_term_housing_need: true, family_size: 4)
        bradley = austin_street.residents.create!(family_name: "Bradley", long_term_housing_need: false, family_size: 2) 

        visit "/shelters/#{arlington_life.id}/edit"
        expect(page).to have_content("EDIT a new shelter record")
        expect(page).to have_content("Shelter Name")
    end
  end
end