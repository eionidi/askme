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

ActiveRecord::Schema.define(version: 20170730204705) do

  create_table "questions", force: :cascade do |t|
    t.string   "name"
    t.string   "text"
    t.string   "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "author_id"
    t.integer  "questioning_user_id"
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "questions_tags", id: false, force: :cascade do |t|
    t.integer "question_id"
    t.integer "tag_id"
  end

  add_index "questions_tags", ["question_id", "tag_id"], name: "index_questions_tags_on_question_id_and_tag_id", unique: true
  add_index "questions_tags", ["question_id"], name: "index_questions_tags_on_question_id"
  add_index "questions_tags", ["tag_id"], name: "index_questions_tags_on_tag_id"

  create_table "tags", force: :cascade do |t|
    t.string   "title"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tags", ["question_id"], name: "index_tags_on_question_id"
  add_index "tags", ["title"], name: "index_tags_on_title", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "avatar_url"
    t.string   "background_color", default: "#73d6d0"
    t.string   "avatar"
  end

end
