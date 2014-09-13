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

ActiveRecord::Schema.define(version: 16) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "active_subscriptions", force: true do |t|
    t.integer  "userId"
    t.integer  "subscriptionId"
    t.date     "renewalDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "userId"
    t.integer  "subscriptionId"
    t.boolean  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
  end

  create_table "servers", force: true do |t|
    t.integer  "userId"
    t.string   "name"
    t.string   "ip"
    t.string   "software"
    t.integer  "slots"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "port"
  end

  create_table "subscriptions", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "billingCycle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
  end

  create_table "team_members", force: true do |t|
    t.integer  "teamId"
    t.integer  "memberId"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "stripeId"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
