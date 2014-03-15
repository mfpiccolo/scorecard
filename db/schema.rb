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

ActiveRecord::Schema.define(version: 20140315000708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.integer  "scorecard_id", null: false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["id"], name: "index_categories_on_id", using: :btree
  add_index "categories", ["scorecard_id"], name: "index_categories_on_scorecard_id", using: :btree

  create_table "organization_users", force: true do |t|
    t.integer  "organization_id", null: false
    t.integer  "user_id",         null: false
    t.string   "role",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organization_users", ["id"], name: "index_organization_users_on_id", using: :btree
  add_index "organization_users", ["organization_id", "user_id"], name: "index_organization_users_on_organization_id_and_user_id", unique: true, using: :btree
  add_index "organization_users", ["organization_id"], name: "index_organization_users_on_organization_id", using: :btree
  add_index "organization_users", ["user_id"], name: "index_organization_users_on_user_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name",       null: false
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organizations", ["id"], name: "index_organizations_on_id", using: :btree
  add_index "organizations", ["name"], name: "index_organizations_on_name", unique: true, using: :btree

  create_table "question_responses", force: true do |t|
    t.text     "text"
    t.integer  "rating"
    t.integer  "question_id", null: false
    t.integer  "response_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "text"
    t.integer  "weight"
    t.integer  "scorecard_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: true do |t|
    t.integer  "scorecard_id",         null: false
    t.integer  "question_response_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scorecards", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "organization_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "categories", "scorecards", name: "categories_scorecard_id_fk"

  add_foreign_key "organization_users", "organizations", name: "organization_users_organization_id_fk"
  add_foreign_key "organization_users", "users", name: "organization_users_user_id_fk"

  add_foreign_key "question_responses", "questions", name: "question_responses_question_id_fk"

  add_foreign_key "questions", "scorecards", name: "questions_scorecard_id_fk"

  add_foreign_key "responses", "question_responses", name: "responses_question_response_id_fk"
  add_foreign_key "responses", "scorecards", name: "responses_scorecard_id_fk"

  add_foreign_key "scorecards", "organizations", name: "scorecards_organization_id_fk"

end
