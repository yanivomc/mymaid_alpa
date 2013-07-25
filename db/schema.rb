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

ActiveRecord::Schema.define(:version => 20130725174014) do

  create_table "pro_categories", :force => true do |t|
    t.string   "profession"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "pro_categories", ["profession"], :name => "index_pro_categories_on_profession", :unique => true

  create_table "pro_category_shares", :force => true do |t|
    t.integer  "procategory_id"
    t.integer  "category_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "pro_category_shares", ["category_id"], :name => "index_pro_category_shares_on_category_id"
  add_index "pro_category_shares", ["procategory_id", "category_id"], :name => "index_pro_category_shares_on_procategory_id_and_category_id", :unique => true
  add_index "pro_category_shares", ["procategory_id"], :name => "index_pro_category_shares_on_procategory_id"

  create_table "professionals", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "country"
    t.string   "email"
    t.string   "state"
    t.string   "zipcode"
    t.string   "address"
    t.string   "profession"
    t.string   "birthday_month"
    t.integer  "birthday_day"
    t.integer  "birthday_year"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "password_digest"
    t.string   "remember_token_professional"
  end

  add_index "professionals", ["email"], :name => "index_professionals_on_email", :unique => true
  add_index "professionals", ["first_name"], :name => "index_professionals_on_first_name"
  add_index "professionals", ["last_name"], :name => "index_professionals_on_last_name"
  add_index "professionals", ["profession"], :name => "index_professionals_on_profession"
  add_index "professionals", ["remember_token_professional"], :name => "index_professionals_on_remember_token"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "birthday_month"
    t.integer  "birthday_day"
    t.integer  "birthday_year"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "address"
    t.string   "zipcode"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "users_pro_shares", :force => true do |t|
    t.integer  "user_id"
    t.integer  "professional_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users_pro_shares", ["professional_id"], :name => "index_users_pro_shares_on_professional_id"
  add_index "users_pro_shares", ["user_id", "professional_id"], :name => "index_users_pro_shares_on_user_id_and_professional_id", :unique => true
  add_index "users_pro_shares", ["user_id"], :name => "index_users_pro_shares_on_user_id"

end
