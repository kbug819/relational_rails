class DropTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :disaster_shelters
  end
end
