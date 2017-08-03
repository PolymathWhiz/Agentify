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

ActiveRecord::Schema.define(version: 20170803134357) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.index ["admin"], name: "index_admins_on_admin"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "businesses", force: :cascade do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "business_name"
    t.string   "phno"
    t.string   "state"
    t.string   "city"
    t.text     "address"
    t.string   "business_website"
    t.string   "requester_name"
    t.string   "requester_email"
    t.boolean  "admin",                  default: false
    t.boolean  "activated",              default: false
    t.string   "agency_type"
    t.text     "about",                  default: "",        null: false
    t.string   "avatar"
    t.string   "slug"
    t.string   "country",                default: "Nigeria"
    t.string   "registration_number"
    t.index ["activated"], name: "index_businesses_on_activated"
    t.index ["admin"], name: "index_businesses_on_admin"
    t.index ["business_name"], name: "index_businesses_on_business_name"
    t.index ["city"], name: "index_businesses_on_city"
    t.index ["email"], name: "index_businesses_on_email", unique: true
    t.index ["reset_password_token"], name: "index_businesses_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_businesses_on_slug", unique: true
    t.index ["state"], name: "index_businesses_on_state"
  end

end
