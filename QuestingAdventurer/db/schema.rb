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

ActiveRecord::Schema.define(version: 20150412062414) do

  create_table "PendingAdventurer", id: false, force: :cascade do |t|
    t.integer "QuestID",      limit: 4, null: false
    t.integer "AdventurerID", limit: 4, null: false
  end

  add_index "pendingadventurer", ["QuestID"], name: "pendingadventurer_ibfk_1", using: :btree

  create_table "Quest", primary_key: "QuestID", force: :cascade do |t|
    t.integer  "QuestGiverID",   limit: 4,                            null: false
    t.integer  "AdventurerID",   limit: 4,                            null: false
    t.string   "Title",          limit: 100,                          null: false
    t.decimal  "Price",                       precision: 8, scale: 2, null: false
    t.string   "Desciption",     limit: 1000,                         null: false
    t.datetime "PostTime",                                            null: false
    t.datetime "ExpirationTime",                                      null: false
  end

  create_table "User", primary_key: "UserID", force: :cascade do |t|
    t.string "Username", limit: 20,  null: false
    t.string "Email",    limit: 100, null: false
    t.string "Password", limit: 20,  null: false
  end

  create_table "UserAddress", primary_key: "UserID", force: :cascade do |t|
    t.string  "Country", limit: 20,  null: false
    t.string  "State",   limit: 2,   null: false
    t.integer "Zipcode", limit: 4,   null: false
    t.string  "Address", limit: 100, null: false
  end

  create_table "UserInfo", primary_key: "UserID", force: :cascade do |t|
    t.string  "Firstname",        limit: 100,                         null: false
    t.string  "Lastname",         limit: 100,                         null: false
    t.string  "Gender",           limit: 6,                           null: false
    t.decimal "QuestGiverRating",             precision: 3, scale: 2, null: false
    t.decimal "AdventurerRating",             precision: 3, scale: 2, null: false
  end

  create_table "UserPhoneNumber", id: false, force: :cascade do |t|
    t.integer "UserID",      limit: 4, null: false
    t.integer "PhoneNumber", limit: 4, null: false
  end

  add_index "userphonenumber", ["UserID"], name: "userphonenumber_ibfk_1", using: :btree

  add_foreign_key "PendingAdventurer", "Quest", column: "QuestID", primary_key: "QuestID", name: "pendingadventurer_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "UserAddress", "User", column: "UserID", primary_key: "UserID", name: "useraddress_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "UserInfo", "User", column: "UserID", primary_key: "UserID", name: "userinfo_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "UserPhoneNumber", "User", column: "UserID", primary_key: "UserID", name: "userphonenumber_ibfk_1", on_update: :cascade, on_delete: :cascade
end
