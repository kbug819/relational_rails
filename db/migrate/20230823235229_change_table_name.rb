class ChangeTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :disaster_shelters, :disaster_shelter
  end
end
