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

ActiveRecord::Schema[7.0].define(version: 2023_05_03_214503) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "icao"
    t.string "name"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pilots", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "enrollment"
    t.string "firstname"
    t.string "lastname"
    t.integer "profile"
    t.integer "rank"
    t.integer "status"
    t.integer "total_flights"
    t.time "total_hours"
    t.string "ivao"
    t.string "vatsim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_pilots_on_email", unique: true
    t.index ["reset_password_token"], name: "index_pilots_on_reset_password_token", unique: true
  end

  create_table "pireps", force: :cascade do |t|
    t.bigint "pilot_id", null: false
    t.string "orig"
    t.string "dest"
    t.string "eqpt"
    t.string "hours"
    t.text "pirep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pilot_id"], name: "index_pireps_on_pilot_id"
  end

  add_foreign_key "pireps", "pilots"
end
