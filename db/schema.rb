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

ActiveRecord::Schema.define(version: 20141227041350) do

  create_table "buyers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "gravator_url"
  end

  add_index "buyers", ["email"], name: "index_buyers_on_email"
  add_index "buyers", ["remember_token"], name: "index_buyers_on_remember_token"

  create_table "comments", force: true do |t|
    t.integer  "product_id"
    t.integer  "buyer_id"
    t.decimal  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
  end

  add_index "comments", ["item_id"], name: "index_comments_on_item_id"

  create_table "items", force: true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product_name"
    t.decimal  "product_price"
    t.boolean  "commentable"
  end

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.string   "product_name"
    t.decimal  "product_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "buyer_id"
    t.string   "remember_token2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "total_cost"
    t.string   "status"
  end

  add_index "orders", ["status"], name: "index_orders_on_status"

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.decimal  "price",       precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "music_url"
    t.string   "type"
    t.string   "flag"
  end

  add_index "products", ["music_url"], name: "index_products_on_music_url"

  create_table "tests", force: true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unpaid_orders", force: true do |t|
    t.integer  "buyer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "user_name"
    t.string   "password"
    t.string   "mailaddress"
    t.string   "favors"
    t.string   "buy_records"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
