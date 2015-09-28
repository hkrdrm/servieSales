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

ActiveRecord::Schema.define(version: 56) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "surname",          limit: 255
    t.string   "email",            limit: 255
    t.string   "crypted_password", limit: 255
    t.string   "role",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "active_subscriptions", force: :cascade do |t|
    t.integer  "userId",         limit: 4
    t.integer  "subscriptionId", limit: 4
    t.date     "renewalDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "config_options", force: :cascade do |t|
    t.string   "option",            limit: 255
    t.string   "possible_settings", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "user_editable"
  end

  add_index "config_options", ["option"], name: "index_config_options_on_option", unique: true, using: :btree

  create_table "invoices", force: :cascade do |t|
    t.integer  "userId",     limit: 4
    t.integer  "orderId",    limit: 4
    t.integer  "amount",     limit: 4
    t.boolean  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "userId",     limit: 4
    t.string   "subject",    limit: 255
    t.string   "body",       limit: 255
    t.string   "from",       limit: 255
    t.boolean  "notify"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "userId",         limit: 4
    t.integer  "subscriptionId", limit: 4
    t.string   "paymentMethod",  limit: 255
    t.boolean  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price",          limit: 4
    t.integer  "nSlots",         limit: 4
    t.integer  "serverId",       limit: 4
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "price",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "server_configs", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "database",                 limit: 255
    t.string   "dbus",                     limit: 255
    t.string   "dbusservice",              limit: 255
    t.string   "ice",                      limit: 255
    t.string   "icesecretread",            limit: 255
    t.string   "icesecretwrite",           limit: 255
    t.string   "MurmurPublishedEndpoints", limit: 255
    t.string   "autobanAttempts",          limit: 255
    t.string   "autobanTimeframe",         limit: 255
    t.string   "uname",                    limit: 255
    t.string   "obfuscate",                limit: 255
    t.string   "sendversion",              limit: 255
    t.string   "allowping",                limit: 255
    t.string   "logdays",                  limit: 255
    t.string   "welcometext",              limit: 255
    t.string   "port",                     limit: 255
    t.string   "sslCert",                  limit: 255
    t.string   "sslKey",                   limit: 255
    t.string   "bonjour",                  limit: 255
    t.string   "bandwidth",                limit: 255
    t.string   "timeout",                  limit: 255
    t.string   "users",                    limit: 255
    t.string   "usersperchannel",          limit: 255
    t.string   "channelname",              limit: 255
    t.string   "username",                 limit: 255
    t.string   "defaultchannel",           limit: 255
    t.string   "rememberchannel",          limit: 255
    t.string   "textmessagelength",        limit: 255
    t.string   "imagemessagelength",       limit: 255
    t.string   "allowhtml",                limit: 255
    t.string   "opusthreshold",            limit: 255
    t.string   "registerName",             limit: 255
    t.string   "registerPassword",         limit: 255
    t.string   "registerUrl",              limit: 255
    t.string   "registerHostname",         limit: 255
    t.string   "suggestVersion",           limit: 255
    t.string   "suggestPositional",        limit: 255
    t.string   "suggestPushToTalk",        limit: 255
    t.integer  "server_id",                limit: 4
    t.string   "password",                 limit: 255
    t.string   "logfile",                  limit: 255
  end

  create_table "server_nodes", force: :cascade do |t|
    t.string   "city",            limit: 255
    t.string   "state",           limit: 255
    t.integer  "ram",             limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ip",              limit: 255
    t.integer  "active_accounts", limit: 4
    t.integer  "max_accounts",    limit: 4
  end

  create_table "servers", force: :cascade do |t|
    t.integer  "userId",            limit: 4
    t.string   "name",              limit: 255
    t.string   "ip",                limit: 255
    t.string   "software",          limit: 255
    t.integer  "slots",             limit: 4
    t.string   "password",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "port",              limit: 4
    t.string   "superUserPassword", limit: 255
    t.datetime "expires"
    t.string   "subscriptionId",    limit: 255
    t.integer  "node_id",           limit: 4
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.integer  "billingCycle", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price",        limit: 4
  end

  create_table "user_configs", force: :cascade do |t|
    t.string   "option",     limit: 255
    t.string   "setting",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            limit: 255
    t.string   "crypted_password", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",         limit: 255
    t.string   "stripeId",         limit: 255
    t.string   "displayName",      limit: 255
    t.boolean  "admin"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
