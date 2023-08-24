class AddDisasterSheltersToResidents < ActiveRecord::Migration[7.0]
  def change
    add_reference :residents, :disaster_shelters, null: false, foreign_key: true
  end
end
