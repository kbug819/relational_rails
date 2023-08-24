class CreateResidents2 < ActiveRecord::Migration[7.0]
  def change
    create_table :residents do |t|
      t.string :family_name
      t.boolean :long_term_housing_need
      t.integer :family_size

      t.timestamps
    end
  end
end
