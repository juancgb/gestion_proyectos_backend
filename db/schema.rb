# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180909184054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.bigint "process_level_id"
    t.bigint "project_process_id"
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["process_level_id"], name: "index_activities_on_process_level_id"
    t.index ["project_process_id"], name: "index_activities_on_project_process_id"
  end

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "faculty_id"
    t.index ["faculty_id"], name: "index_careers_on_faculty_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "office_careers", force: :cascade do |t|
    t.bigint "office_id"
    t.bigint "career_id"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["career_id"], name: "index_office_careers_on_career_id"
    t.index ["office_id"], name: "index_office_careers_on_office_id"
  end

  create_table "offices", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "process_level_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "process_levels", force: :cascade do |t|
    t.bigint "project_process_id"
    t.bigint "process_level_status_id"
    t.boolean "mandatory"
    t.boolean "request"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["process_level_status_id"], name: "index_process_levels_on_process_level_status_id"
    t.index ["project_process_id"], name: "index_process_levels_on_project_process_id"
  end

  create_table "project_processes", force: :cascade do |t|
    t.bigint "office_id"
    t.string "name"
    t.bigint "career_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "levels_number"
    t.boolean "status"
    t.index ["career_id"], name: "index_project_processes_on_career_id"
    t.index ["office_id"], name: "index_project_processes_on_office_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "office_id"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.index ["office_id"], name: "index_user_roles_on_office_id"
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "activities", "process_levels"
  add_foreign_key "activities", "project_processes"
  add_foreign_key "careers", "faculties"
  add_foreign_key "office_careers", "careers"
  add_foreign_key "office_careers", "offices"
  add_foreign_key "process_levels", "process_level_statuses"
  add_foreign_key "process_levels", "project_processes"
  add_foreign_key "project_processes", "careers"
  add_foreign_key "project_processes", "offices"
  add_foreign_key "user_roles", "offices"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
