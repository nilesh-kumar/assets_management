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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131230075704) do

  create_table "asset_requests", :force => true do |t|
    t.integer  "vendor_id"
    t.string   "title"
    t.text     "description"
    t.datetime "date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "client_assets", :force => true do |t|
    t.integer  "referenceable_id"
    t.string   "referenceable_type"
    t.string   "client_name"
    t.integer  "project_manager_id"
    t.integer  "employee_id"
    t.string   "department"
    t.boolean  "deleted"
    t.datetime "deleted_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "computers", :force => true do |t|
    t.string   "name"
    t.integer  "vendor_id"
    t.integer  "invoice_id"
    t.string   "ip_address"
    t.string   "os"
    t.string   "os_version"
    t.boolean  "laptop"
    t.string   "branch"
    t.string   "provider"
    t.string   "warranty"
    t.boolean  "deleted"
    t.datetime "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "employees", :force => true do |t|
    t.integer  "employee_number"
    t.string   "name"
    t.string   "designation"
    t.string   "technology"
    t.string   "department"
    t.string   "branch"
    t.datetime "join_date"
    t.datetime "resign_date"
    t.string   "transfered_from"
    t.string   "transfered_to"
    t.string   "email_id"
    t.string   "email_password"
    t.string   "skype_id"
    t.string   "skype_password"
    t.string   "pm_tool_id"
    t.string   "pm_tool_password"
    t.string   "pandian_id"
    t.string   "pandian_password"
    t.string   "wiki_id"
    t.string   "wiki_password"
    t.string   "sapience_id"
    t.string   "sapience_password"
    t.string   "helpdesk_id"
    t.string   "helpdesk_password"
    t.boolean  "deleted"
    t.datetime "deleted_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "quotations", :force => true do |t|
    t.integer  "asset_request_id"
    t.integer  "vendor_id"
    t.string   "title"
    t.text     "description"
    t.datetime "date"
    t.float    "cost"
    t.boolean  "accepted",         :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "contact_no"
    t.integer  "fax_no"
    t.integer  "mobile_no"
    t.string   "website"
    t.boolean  "deleted"
    t.datetime "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
