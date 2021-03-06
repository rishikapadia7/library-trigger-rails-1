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

ActiveRecord::Schema.define(:version => 20130226200355) do

  create_table "books", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.boolean  "checked_out", :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "books", ["id"], :name => "index_books_on_id"

  create_table "patrons", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "patrons", ["id"], :name => "index_patrons_on_id"

  create_table "transactions", :force => true do |t|
    t.integer  "patron_id"
    t.integer  "book_id"
    t.datetime "checkout_date"
    t.datetime "checkin_date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "transactions", ["book_id"], :name => "index_transactions_on_book_id"
  add_index "transactions", ["patron_id"], :name => "index_transactions_on_patron_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
