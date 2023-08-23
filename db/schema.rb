# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_23_022956) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "disaster_shelters", force: :cascade do |t|
    t.string "shelter_name"
    t.string "address"
    t.boolean "case_management_available"
    t.integer "capasity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residents", force: :cascade do |t|
    t.string "family_name"
    t.boolean "long_term_housing_need"
    t.integer "family_size"
    t.bigint "disaster_shelters_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disaster_shelters_id"], name: "index_residents_on_disaster_shelters_id"
  end

  add_foreign_key "residents", "disaster_shelters", column: "disaster_shelters_id"
end
