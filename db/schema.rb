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

ActiveRecord::Schema.define(version: 20150619001854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buses", force: :cascade do |t|
    t.string   "name"
    t.integer  "route_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "buses", ["route_id"], name: "index_buses_on_route_id", using: :btree

  create_table "route_stops", force: :cascade do |t|
    t.integer  "route_id"
    t.integer  "stop_id"
    t.string   "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "route_stops", ["route_id"], name: "index_route_stops_on_route_id", using: :btree
  add_index "route_stops", ["stop_id"], name: "index_route_stops_on_stop_id", using: :btree

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stop_times", force: :cascade do |t|
    t.integer  "bus_id"
    t.integer  "route_stop_id"
    t.datetime "estimated_stop_time"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "stop_times", ["bus_id"], name: "index_stop_times_on_bus_id", using: :btree
  add_index "stop_times", ["route_stop_id"], name: "index_stop_times_on_route_stop_id", using: :btree

  create_table "stops", force: :cascade do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "buses", "routes"
  add_foreign_key "route_stops", "routes"
  add_foreign_key "route_stops", "stops"
  add_foreign_key "stop_times", "buses"
  add_foreign_key "stop_times", "route_stops"
end
