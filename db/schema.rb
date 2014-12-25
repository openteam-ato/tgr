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

ActiveRecord::Schema.define(:version => 20141225025649) do

  create_table "datasets", :force => true do |t|
    t.integer  "opendata_id"
    t.string   "tracking_number"
    t.text     "title"
    t.text     "description"
    t.text     "owner"
    t.text     "responsible"
    t.string   "phone"
    t.string   "email"
    t.date     "first_publish_date"
    t.date     "last_update_date"
    t.text     "last_update_description"
    t.date     "relevance_date"
    t.text     "keywords"
    t.string   "version_guidelines"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "meta_file_name"
    t.string   "meta_content_type"
    t.integer  "meta_file_size"
    t.datetime "meta_updated_at"
  end

  create_table "opendata", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "list_file_name"
    t.string   "list_content_type"
    t.integer  "list_file_size"
    t.datetime "list_updated_at"
  end

end
