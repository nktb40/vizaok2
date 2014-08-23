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

ActiveRecord::Schema.define(version: 20140823155903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addinfos", force: true do |t|
    t.integer  "visa_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_cd"
  end

  create_table "documents", force: true do |t|
    t.integer  "visa_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: true do |t|
    t.integer  "visa_id"
    t.string   "name"
    t.text     "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lnk_visa_purposes", force: true do |t|
    t.integer  "visa_id"
    t.integer  "purpose_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_ip"
    t.string   "visa_country"
    t.string   "visa_type"
    t.string   "skype"
    t.string   "visa_purpose"
    t.string   "user_country"
    t.string   "user_city"
  end

  create_table "prices", force: true do |t|
    t.integer  "visa_id"
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.string   "currency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purposes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "purpose_cd"
  end

  create_table "questions", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "question"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_ip"
    t.text     "address"
    t.string   "visa_country"
    t.string   "skype"
  end

  create_table "subtypes", force: true do |t|
    t.integer  "visatype_id"
    t.string   "name"
    t.string   "subtype_cd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visas", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_cd"
    t.string   "type_cd"
    t.integer  "subtype_id"
    t.string   "visa_cd"
    t.string   "shortdesc"
    t.string   "translit"
    t.string   "slug"
  end

  create_table "visatypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_cd"
    t.string   "migration"
  end

end
