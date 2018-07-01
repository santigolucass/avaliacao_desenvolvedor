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

ActiveRecord::Schema.define(version: 20180701134131) do

  create_table "costumers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.string   "address"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", force: true do |t|
    t.integer  "provider_id"
    t.integer  "costumer_id"
    t.integer  "quantity"
    t.string   "description"
    t.float    "unity_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["costumer_id"], name: "index_purchases_on_costumer_id"
  add_index "purchases", ["provider_id"], name: "index_purchases_on_provider_id"

end
