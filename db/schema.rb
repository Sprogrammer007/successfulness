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

ActiveRecord::Schema.define(version: 20150212053226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_category_id"
    t.text     "collaborators",          default: [],                    array: true
    t.string   "title"
    t.text     "description"
    t.string   "course_type"
    t.decimal  "price"
    t.string   "payment_method"
    t.integer  "max_student",            default: 0
    t.integer  "discount"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.text     "prerequisites",          default: [],                    array: true
    t.datetime "start_date",             default: '2015-03-12 00:00:00'
    t.datetime "end_date",               default: '2015-03-12 23:59:59'
    t.string   "status",                 default: "draft"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["course_type"], name: "index_courses_on_course_type", using: :btree
  add_index "courses", ["title"], name: "index_courses_on_title", unique: true, using: :btree

  create_table "events", force: true do |t|
    t.string   "type"
    t.string   "teachers"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string "title"
    t.text   "description"
  end

  create_table "page_templates", force: true do |t|
    t.string   "name"
    t.string   "descriptions"
    t.string   "category"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
  end

  add_index "page_templates", ["category"], name: "index_page_templates_on_category", using: :btree

  create_table "sections", force: true do |t|
    t.string   "collaborators"
    t.string   "title"
    t.string   "note"
    t.string   "section_type"
    t.integer  "course_id"
    t.integer  "user_id"
    t.integer  "page_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["section_type"], name: "index_sections_on_section_type", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                      default: "", null: false
    t.string   "password_digest",            default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",              default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "group_id"
    t.string   "username",                   default: "", null: false
    t.string   "type"
    t.string   "display_image_file_name"
    t.string   "display_image_content_type"
    t.integer  "display_image_file_size"
    t.datetime "display_image_updated_at"
    t.text     "profile"
    t.text     "courses_access"
    t.text     "events_access"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
