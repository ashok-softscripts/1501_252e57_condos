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

ActiveRecord::Schema.define(version: 20140924192533) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "published_date"
    t.string   "article_file_name"
    t.string   "article_content_type"
    t.integer  "article_file_size"
    t.datetime "article_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "update_section",       default: false
    t.boolean  "detail_section",       default: false
  end

  create_table "change_logs", force: true do |t|
    t.string   "who"
    t.string   "action"
    t.string   "object_type"
    t.integer  "object_id"
    t.string   "object_name"
    t.boolean  "for_admin"
    t.text     "object_serialized"
    t.text     "object_delta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "floor_plans", force: true do |t|
    t.string   "residence"
    t.float    "price",             limit: 24
    t.integer  "bedrooms"
    t.float    "bathrooms",         limit: 24
    t.string   "additions"
    t.float    "indoor_sq_ft",      limit: 24
    t.float    "indoor_sq_m",       limit: 24
    t.float    "outdoor_sq_ft",     limit: 24
    t.float    "outdoor_sq_m",      limit: 24
    t.float    "common_charges",    limit: 24
    t.float    "monthly_total",     limit: 24
    t.string   "pilot"
    t.boolean  "avaliable_general"
    t.boolean  "avaliable_admins"
    t.string   "plan_file_name"
    t.string   "plan_content_type"
    t.integer  "plan_file_size"
    t.datetime "plan_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", force: true do |t|
    t.string   "title"
    t.boolean  "public_available",       default: false
    t.boolean  "update_section",         default: false
    t.boolean  "neighborhood_ava",       default: false
    t.boolean  "private_available"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "published_date"
    t.boolean  "detail_section",         default: false
    t.string   "heading"
  end

  create_table "gallery_images", force: true do |t|
    t.string   "name"
    t.string   "alt_name"
    t.integer  "sequence"
    t.integer  "gallery_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "private_sites", force: true do |t|
    t.string   "receiver_email"
    t.string   "receiver_name"
    t.string   "email_cc"
    t.string   "email_bcc"
    t.text     "ps_email"
    t.text     "welcome_msg"
    t.string   "ps_specials"
    t.string   "uniq_ident"
    t.date     "ps_send"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "welcome_signiture"
  end

  create_table "private_videos", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.boolean  "update_section",         default: false
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "published_date"
    t.string   "heading"
  end

  create_table "public_users", force: true do |t|
    t.string   "name"
    t.boolean  "broker"
    t.string   "phone"
    t.string   "email"
    t.string   "country"
    t.string   "size"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_items", force: true do |t|
    t.integer  "private_site_id"
    t.string   "si_update"
    t.integer  "si_item_id"
    t.string   "si_item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "si_detail",       default: false
  end

  create_table "users", force: true do |t|
    t.string   "type"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "video_sections", force: true do |t|
    t.string   "section"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
