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

ActiveRecord::Schema.define(version: 20140724095640) do

  create_table "clients", force: true do |t|
    t.string   "name",       null: false
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.integer  "project_id",                     null: false
    t.string   "reference",                      null: false
    t.string   "currency",                       null: false
    t.date     "date",                           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "paid"
    t.float    "default_currency_exchange_rate"
    t.integer  "unit"
  end

  add_index "invoices", ["project_id"], name: "index_invoices_on_project_id", using: :btree

  create_table "line_items", force: true do |t|
    t.integer  "invoice_id"
    t.string   "description",                                       null: false
    t.decimal  "quantity",    precision: 8, scale: 2
    t.decimal  "price",       precision: 8, scale: 2, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["invoice_id"], name: "index_line_items_on_invoice_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name",               null: false
    t.string   "code",               null: false
    t.integer  "client_id",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "redmine_project_id"
    t.string   "currency"
  end

  add_index "projects", ["client_id"], name: "index_projects_on_client_id", using: :btree

end
