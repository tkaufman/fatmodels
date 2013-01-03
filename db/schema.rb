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

ActiveRecord::Schema.define(:version => 20130103033316) do

  create_table "abstracts", :force => true do |t|
    t.string  "title"
    t.string  "description"
    t.integer "speaker_id"
  end

  create_table "feedbacks", :force => true do |t|
    t.integer "presentation_id"
    t.integer "attendee_id"
    t.integer "rating"
    t.string  "comment"
  end

  create_table "people", :force => true do |t|
    t.string "name"
    t.string "email"
    t.date   "birthdate"
    t.string "type"
  end

  create_table "presentations", :force => true do |t|
    t.integer "speaker_id"
    t.integer "abstract_id"
    t.date    "presented_on"
  end

end
