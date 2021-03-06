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

ActiveRecord::Schema.define(version: 20150304023405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "relation_id"
    t.text     "answer"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "question_id"
    t.boolean  "is_validated"
  end

  create_table "items", force: :cascade do |t|
    t.datetime "datetime"
    t.string   "name"
    t.string   "state"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "contact_email"
    t.string   "reward"
    t.string   "category"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question_type"
    t.text     "name"
    t.boolean  "is_validated",  default: false
    t.string   "answer"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "item_id"
  end

  create_table "relations", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.string   "type"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "has_validated_questions"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
