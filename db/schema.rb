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

ActiveRecord::Schema.define(version: 20160221140411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.string   "description", limit: 500
    t.string   "link",        limit: 500
    t.string   "image",       limit: 500
    t.decimal  "last_price",              precision: 10, scale: 2
    t.decimal  "old_price",               precision: 10, scale: 2
    t.boolean  "mail_sent"
    t.boolean  "visited"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "alert_range"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "description", limit: 500
    t.string   "link",        limit: 500
    t.string   "image",       limit: 500
    t.decimal  "last_price",              precision: 10, scale: 2
    t.integer  "alert_range"
    t.integer  "website_id"
    t.integer  "category_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "websites", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.string   "logo"
    t.string   "regular_price_tag"
    t.string   "discounted_price_tag"
    t.string   "product_description_tag"
    t.string   "product_image_tag"
    t.boolean  "status"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
