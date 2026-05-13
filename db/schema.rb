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

ActiveRecord::Schema[7.2].define(version: 2026_05_12_150153) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "person_record_tags", force: :cascade do |t|
    t.bigint "person_record_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_record_id"], name: "index_person_record_tags_on_person_record_id"
    t.index ["tag_id"], name: "index_person_record_tags_on_tag_id"
  end

  create_table "person_records", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "nickname", null: false
    t.date "met_on"
    t.text "good_points"
    t.text "concerns"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_person_records_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.string "tag_type", null: false
    t.string "sentiment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "person_record_tags", "person_records"
  add_foreign_key "person_record_tags", "tags"
  add_foreign_key "person_records", "users"
  add_foreign_key "tags", "users"
end
