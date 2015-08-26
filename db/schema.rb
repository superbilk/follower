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

ActiveRecord::Schema.define(version: 20150826174052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "twitter_accounts", id: false, force: :cascade do |t|
    t.integer  "id",          limit: 8, null: false
    t.string   "screen_name",           null: false
    t.string   "name",                  null: false
    t.string   "location"
    t.string   "image_https",           null: false
    t.text     "description"
    t.string   "website"
    t.string   "twitter_url",           null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "twitter_accounts", ["id"], name: "index_twitter_accounts_on_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "provider",                        null: false
    t.string   "uid",                             null: false
    t.string   "username",                        null: false
    t.string   "oauth_token"
    t.string   "oauth_secret"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree
  add_index "users", ["username", "provider"], name: "index_users_on_username_and_provider", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
