class ChangeTableName2 < ActiveRecord::Migration[7.0]
  def change
    rename_table :disaster_shelter, :shelters
  end
end
