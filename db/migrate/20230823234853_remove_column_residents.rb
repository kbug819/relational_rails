class RemoveColumnResidents < ActiveRecord::Migration[7.0]
  def change
    remove_column :residents, :disaster_shelters_id
  end
end
