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

ActiveRecord::Schema.define(version: 20140204142819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "deliveries", force: true do |t|
    t.integer  "user_id",      null: false
    t.integer  "task_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "text"
    t.string   "file"
    t.datetime "delivered_at"
    t.datetime "accepted_at"
    t.datetime "rejected_at"
  end

  create_table "mobilizations", force: true do |t|
    t.string "hashtag"
    t.string "short_title"
  end

  create_table "task_types", force: true do |t|
    t.string   "name"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "task_types", ["category_id"], name: "index_task_types_on_category_id", using: :btree

  create_table "tasks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",            null: false
    t.text     "description",      null: false
    t.integer  "task_type_id",     null: false
    t.string   "skills",                        array: true
    t.datetime "deadline"
    t.integer  "points",           null: false
    t.string   "hashtag"
    t.integer  "max_deliveries"
    t.integer  "user_id",          null: false
    t.text     "description_html"
  end

  create_table "users", id: false, force: true do |t|
    t.integer "id",                      null: false
    t.string  "email",      default: "", null: false
    t.string  "first_name",              null: false
    t.string  "last_name",               null: false
    t.string  "avatar"
    t.string  "skills",     default: [],              array: true
    t.boolean "admin"
  end

end
