# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140808031219) do

  create_table "positions", force: true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "shortname"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_projects", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "leader"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_projects", ["project_id"], name: "index_user_projects_on_project_id"
  add_index "user_projects", ["user_id", "project_id"], name: "index_user_projects_on_user_id_and_project_id", unique: true
  add_index "user_projects", ["user_id"], name: "index_user_projects_on_user_id"

  create_table "user_skills", force: true do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.integer  "level"
    t.integer  "usedyear"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_skills", ["skill_id"], name: "index_user_skills_on_skill_id"
  add_index "user_skills", ["user_id", "skill_id"], name: "index_user_skills_on_user_id_and_skill_id", unique: true
  add_index "user_skills", ["user_id"], name: "index_user_skills_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.date     "birthday"
    t.integer  "position_id"
    t.integer  "admin",           default: 0
    t.integer  "team_id"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
