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

ActiveRecord::Schema.define(version: 20150415183151) do

  create_table "addresses", force: :cascade do |t|
    t.integer "user_id",  limit: 4
    t.string  "address",  limit: 255
    t.string  "country",  limit: 255
    t.string  "state",    limit: 255
    t.decimal "zip_code",             precision: 10
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "pendings", force: :cascade do |t|
    t.integer "quest_id", limit: 4
    t.integer "user_id",  limit: 4
  end

  add_index "pendings", ["quest_id"], name: "fk_rails_1d42d25f6e", using: :btree
  add_index "pendings", ["user_id"], name: "fk_rails_5df17245c3", using: :btree

  create_table "phone_numbers", force: :cascade do |t|
    t.integer "user_id",      limit: 4
    t.decimal "phone_number",           precision: 10
  end

  add_index "phone_numbers", ["user_id"], name: "index_phone_numbers_on_user_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id",           limit: 4
    t.string  "first_name",        limit: 255
    t.string  "last_name",         limit: 255
    t.string  "gender",            limit: 255
    t.decimal "questgiver_rating",             precision: 10
    t.decimal "adventurer_rating",             precision: 10
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "quests", force: :cascade do |t|
    t.integer  "questgiver_id",   limit: 4
    t.integer  "adventurer_id",   limit: 4
    t.string   "title",           limit: 255
    t.decimal  "price",                       precision: 10
    t.string   "description",     limit: 255
    t.datetime "post_time"
    t.datetime "expiration_time"
  end

  add_index "quests", ["adventurer_id"], name: "fk_rails_0c7092bc37", using: :btree
  add_index "quests", ["questgiver_id"], name: "fk_rails_e14fc99b08", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "addresses", "users"
  add_foreign_key "pendings", "quests"
  add_foreign_key "pendings", "users"
  add_foreign_key "phone_numbers", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "quests", "users", column: "adventurer_id"
  add_foreign_key "quests", "users", column: "questgiver_id"
end
