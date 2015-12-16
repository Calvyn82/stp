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

ActiveRecord::Schema.define(version: 20151216161922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "patient_therapist_relationships", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "therapist_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "patient_therapist_relationships", ["patient_id"], name: "index_patient_therapist_relationships_on_patient_id", using: :btree
  add_index "patient_therapist_relationships", ["therapist_id"], name: "index_patient_therapist_relationships_on_therapist_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "username",             null: false
    t.string   "password_digest",      null: false
    t.string   "name"
    t.string   "phone"
    t.string   "email",                null: false
    t.string   "zipcode",              null: false
    t.string   "gender"
    t.string   "former_religion",      null: false
    t.string   "description",          null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "verified_at"
    t.string   "verification_token"
    t.string   "password_reset_token"
  end

  create_table "therapists", force: :cascade do |t|
    t.string   "username",             null: false
    t.string   "password_digest",      null: false
    t.string   "first_name",           null: false
    t.string   "last_name",            null: false
    t.string   "phone",                null: false
    t.string   "email",                null: false
    t.string   "address",              null: false
    t.string   "city",                 null: false
    t.string   "state",                null: false
    t.string   "country",              null: false
    t.string   "zipcode",              null: false
    t.string   "practice",             null: false
    t.integer  "years_experience",     null: false
    t.string   "qualifications",       null: false
    t.string   "website"
    t.string   "gender",               null: false
    t.string   "religion",             null: false
    t.string   "former_religion"
    t.string   "licenses",             null: false
    t.string   "main_license",         null: false
    t.boolean  "distance_counseling",  null: false
    t.string   "languages"
    t.string   "purpose",              null: false
    t.string   "description"
    t.string   "approach"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "geo_address"
    t.datetime "verified_at"
    t.string   "verification_token"
    t.string   "password_reset_token"
  end

  add_foreign_key "patient_therapist_relationships", "patients"
  add_foreign_key "patient_therapist_relationships", "therapists"
end
