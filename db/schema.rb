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

ActiveRecord::Schema.define(:version => 20110916221752) do

  create_table "accounts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forms", :force => true do |t|
    t.string   "heading"
    t.text     "description"
    t.integer  "page_id"
    t.integer  "website_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "website_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
  end

  create_table "gallery_images", :force => true do |t|
    t.string   "title"
    t.text     "caption"
    t.integer  "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.string   "alt"
    t.string   "src"
    t.integer  "website_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
  end

  create_table "messages", :force => true do |t|
    t.string   "to"
    t.string   "from"
    t.text     "content"
    t.integer  "website_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "visitor_name"
    t.string   "visitor_email"
    t.string   "visitor_phone"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "website_id"
    t.string   "page_type"
    t.string   "permalink"
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.text     "caption"
    t.integer  "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "username"
    t.string   "string"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_state"
    t.string   "confirmation_token"
    t.string   "confirmed_at"
    t.string   "timestamp"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.string   "password_reset_sent_at"
    t.string   "datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  create_table "websites", :force => true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "layout_name"
    t.text     "custom_layout_content"
    t.string   "logo"
    t.integer  "account_id"
  end

end
