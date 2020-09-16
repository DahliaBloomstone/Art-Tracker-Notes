# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 4) do

  create_table "art_plans", force: :cascade do |t|
    t.string "goal"
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_art_plans_on_user_id"
  end

  create_table "art_projects", force: :cascade do |t|
    t.string "medium"
    t.datetime "day"
    t.string "idea"
    t.string "artist_reference"
    t.string "content"
    t.integer "price"
    t.integer "art_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_plan_id"], name: "index_art_projects_on_art_plan_id"
  end

  create_table "art_schedules", force: :cascade do |t|
    t.string "art_time"
    t.string "art_type"
    t.integer "art_id"
    t.integer "art_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_id"], name: "index_art_schedules_on_art_id"
    t.index ["art_plan_id"], name: "index_art_schedules_on_art_plan_id"
    t.index ["art_project_id"] name: "index_art_schedules_on_art_project_id" ##?
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "uid"
    t.string "password_confirmation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  #add_foreign_key "art_plans", "users"
  #add_foreign_key "art_projects", "art_plans"
  #add_foreign_key "art_schedules", "art_plans"
  #add_foreign_key "art_schedules", "arts"
#end
