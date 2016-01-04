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

ActiveRecord::Schema.define(version: 20151215033446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bids", ["job_id"], name: "index_bids_on_job_id", using: :btree
  add_index "bids", ["user_id", "job_id"], name: "index_bids_on_user_id_and_job_id", unique: true, using: :btree
  add_index "bids", ["user_id"], name: "index_bids_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "contractor_id"
    t.integer  "bid_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "comments", ["bid_id"], name: "index_comments_on_bid_id", using: :btree
  add_index "comments", ["contractor_id"], name: "index_comments_on_contractor_id", using: :btree

  create_table "contractor_taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contractor_taggings", ["tag_id"], name: "index_contractor_taggings_on_tag_id", using: :btree
  add_index "contractor_taggings", ["user_id"], name: "index_contractor_taggings_on_user_id", using: :btree

  create_table "general_reviews", force: :cascade do |t|
    t.integer  "reviewer_id"
    t.integer  "reviewee_id"
    t.integer  "rating"
    t.string   "name"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "job_taggings", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "job_taggings", ["job_id"], name: "index_job_taggings_on_job_id", using: :btree
  add_index "job_taggings", ["tag_id"], name: "index_job_taggings_on_tag_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "end_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "budget"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
  end

  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "kind"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "company_name"
    t.string   "phone_number"
    t.boolean  "contractor"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "avatar"
    t.string   "image_one"
    t.string   "image_two"
    t.string   "image_three"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
  end

  add_foreign_key "bids", "jobs"
  add_foreign_key "bids", "users"
  add_foreign_key "comments", "bids"
  add_foreign_key "contractor_taggings", "tags"
  add_foreign_key "contractor_taggings", "users"
  add_foreign_key "job_taggings", "jobs"
  add_foreign_key "job_taggings", "tags"
  add_foreign_key "jobs", "users"
end
