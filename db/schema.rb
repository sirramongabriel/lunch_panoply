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

ActiveRecord::Schema.define(:version => 20140126024816) do

  create_table "comments", :primary_key => "commentable_id", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "commentable_type"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "favorites", :primary_key => "favoritable_id", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "favoritable_type"
  end

  create_table "menu_items", :force => true do |t|
    t.string   "title"
    t.string   "ingredient1"
    t.string   "ingredient2"
    t.string   "ingredient3"
    t.string   "ingredient4"
    t.string   "ingredient5"
    t.string   "ingredient6"
    t.string   "ingredient7"
    t.string   "ingredient8"
    t.string   "ingredient9"
    t.string   "ingredient10"
    t.string   "ingredient11"
    t.string   "ingredient12"
    t.string   "ingredient13"
    t.string   "ingredient14"
    t.string   "ingredient15"
    t.string   "ingredient16"
    t.string   "ingredient17"
    t.string   "ingredient18"
    t.string   "ingredient19"
    t.string   "ingredient20"
    t.string   "calories"
    t.string   "price"
    t.binary   "img1"
    t.binary   "img2"
    t.binary   "img3"
    t.binary   "img4"
    t.binary   "img5"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "menus", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "email"
    t.string   "phone"
    t.string   "fax"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "votes", :primary_key => "votable_id", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "votable_type"
  end

end
