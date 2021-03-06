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

ActiveRecord::Schema.define(version: 20160327230142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.integer  "patient_therapist_relationship_id", null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "conversations", ["patient_therapist_relationship_id"], name: "index_conversations_on_patient_therapist_relationship_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "conversation_id",                 null: false
    t.string   "topic",                           null: false
    t.string   "body",                            null: false
    t.string   "sender_type",                     null: false
    t.integer  "sender_id",                       null: false
    t.string   "receiver_type",                   null: false
    t.integer  "receiver_id",                     null: false
    t.boolean  "opened",          default: false
    t.datetime "opened_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree

  create_table "patient_therapist_relationships", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "therapist_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "status"
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
    t.string   "username",                                    null: false
    t.string   "password_digest",                             null: false
    t.string   "first_name",                                  null: false
    t.string   "last_name",                                   null: false
    t.string   "phone",                                       null: false
    t.string   "email",                                       null: false
    t.string   "address",                                     null: false
    t.string   "city",                                        null: false
    t.string   "state",                                       null: false
    t.string   "country",                                     null: false
    t.string   "zipcode",                                     null: false
    t.string   "practice",                                    null: false
    t.integer  "years_experience",                            null: false
    t.string   "qualifications",                              null: false
    t.string   "website"
    t.string   "gender",                                      null: false
    t.string   "religion",                                    null: false
    t.string   "former_religion"
    t.string   "licenses",                                    null: false
    t.string   "main_license",                                null: false
    t.boolean  "distance_counseling",                         null: false
    t.string   "languages"
    t.string   "purpose",                                     null: false
    t.string   "description"
    t.string   "approach"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "geo_address"
    t.datetime "verified_at"
    t.string   "verification_token"
    t.string   "password_reset_token"
    t.boolean  "admin",                   default: false
    t.boolean  "super_admin",             default: false
    t.boolean  "adolescents",             default: false
    t.boolean  "adults",                  default: false
    t.boolean  "children",                default: false
    t.boolean  "coping_with_change",      default: false
    t.boolean  "depression",              default: false
    t.boolean  "existential",             default: false
    t.boolean  "general_anxiety",         default: false
    t.boolean  "grief_loss",              default: false
    t.boolean  "marriage_family",         default: false
    t.boolean  "mood_disorders",          default: false
    t.boolean  "ocd",                     default: false
    t.boolean  "ptsd",                    default: false
    t.boolean  "relationship_counseling", default: false
    t.boolean  "self_improvement",        default: false
    t.boolean  "sex_therapy",             default: false
    t.boolean  "social_anxiety",          default: false
    t.boolean  "stress_management",       default: false
    t.boolean  "substance_abuse",         default: false
    t.boolean  "trauma_recovery",         default: false
    t.string   "application_status",      default: "pending"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "voter_id"
    t.integer  "votee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "decision"
    t.string   "comment"
  end

  add_index "votes", ["votee_id"], name: "index_votes_on_votee_id", using: :btree
  add_index "votes", ["voter_id", "votee_id"], name: "index_votes_on_voter_id_and_votee_id", unique: true, using: :btree
  add_index "votes", ["voter_id"], name: "index_votes_on_voter_id", using: :btree

  add_foreign_key "patient_therapist_relationships", "patients"
  add_foreign_key "patient_therapist_relationships", "therapists"
end
