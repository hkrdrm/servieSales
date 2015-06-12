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

ActiveRecord::Schema.define(version: 47) do

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

  create_table "config_options", force: true do |t|
    t.string   "option"
    t.string   "possible_settings"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "user_editable"
  end

  add_index "config_options", ["option"], name: "index_config_options_on_option", unique: true, using: :btree

  create_table "invoices", force: true do |t|
    t.integer  "userId"
    t.integer  "orderId"
    t.integer  "amount"
    t.boolean  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "userId"
    t.string   "subject"
    t.string   "body"
    t.string   "from"
    t.boolean  "notify"
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
    t.integer  "nSlots"
    t.integer  "serverId"
    t.datetime "expires"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "server_configs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "database"
    t.string   "dbus"
    t.string   "dbusservice"
    t.string   "ice"
    t.string   "icesecretread"
    t.string   "icesecretwrite"
    t.string   "MurmurPublishedEndpoints"
    t.string   "autobanAttempts"
    t.string   "autobanTimeframe"
    t.string   "uname"
    t.string   "obfuscate"
    t.string   "sendversion"
    t.string   "allowping"
    t.string   "logdays"
    t.string   "welcometext"
    t.string   "port"
    t.string   "sslCert"
    t.string   "sslKey"
    t.string   "bonjour"
    t.string   "bandwidth"
    t.string   "timeout"
    t.string   "users"
    t.string   "usersperchannel"
    t.string   "channelname"
    t.string   "username"
    t.string   "defaultchannel"
    t.string   "rememberchannel"
    t.string   "textmessagelength"
    t.string   "imagemessagelength"
    t.string   "allowhtml"
    t.string   "opusthreshold"
    t.string   "registerName"
    t.string   "registerPassword"
    t.string   "registerUrl"
    t.string   "registerHostname"
    t.string   "suggestVersion"
    t.string   "suggestPositional"
    t.string   "suggestPushToTalk"
    t.integer  "server_id"
    t.string   "password"
    t.string   "logfile"
  end

  create_table "server_nodes", force: true do |t|
    t.string   "city"
    t.string   "state"
    t.integer  "ram"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ip"
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
    t.string   "superUserPassword"
    t.datetime "expires"
    t.string   "subscriptionId"
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

  create_table "user_configs", force: true do |t|
    t.string   "option"
    t.string   "setting"
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
    t.string   "displayName"
    t.boolean  "admin"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
