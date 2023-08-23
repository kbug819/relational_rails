class CreateDisasterShelter < ActiveRecord::Migration[7.0]
  def change
    create_table :disaster_shelters do |t|
      t.string :shelter_name
      t.string :address
      t.boolean :case_management_available
      t.integer :capasity

      t.timestamps
    end
  end
end
