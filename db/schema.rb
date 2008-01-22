# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 10) do

  create_table "alt_widgets", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "calc"
    t.datetime "last_used_at"
    t.integer  "views"
    t.text     "data"
    t.string   "type"
  end

  create_table "invites", :force => true do |t|
    t.string  "message"
    t.integer "inviter_user_id"
    t.integer "accepter_user_id"
    t.string  "token"
  end

  create_table "meetings", :force => true do |t|
    t.string  "name"
    t.integer "cents_per_hour"
    t.string  "currency"
    t.integer "attendance"
    t.string  "owner_cookie"
    t.string  "token"
  end

  create_table "notes", :force => true do |t|
    t.integer  "meeting_id"
    t.datetime "created_at"
    t.datetime "stopped_at"
    t.string   "descr"
  end

  create_table "periods", :force => true do |t|
    t.integer  "meeting_id"
    t.datetime "created_at"
    t.datetime "stopped_at"
    t.string   "descr"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
