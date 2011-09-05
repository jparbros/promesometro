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

ActiveRecord::Schema.define(:version => 20110902143029) do

  create_table "milestones", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "state"
    t.integer  "promise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.text     "note"
    t.string   "note_by"
    t.integer  "noteable_id"
    t.string   "noteable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "officials", :force => true do |t|
    t.string   "name"
    t.string   "avatar"
    t.string   "twitter"
    t.string   "facebook"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
    t.integer  "province_id"
    t.integer  "political_party_id"
  end

  create_table "political_parties", :force => true do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promises", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "official_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promises_topics", :id => false, :force => true do |t|
    t.integer "promise_id"
    t.integer "topic_id"
  end

  create_table "provinces", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
