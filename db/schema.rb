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

ActiveRecord::Schema.define(version: 20170218161232) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "firstname",              limit: 255,              null: false
    t.string   "lastname",               limit: 255,              null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree

  create_table "order_lines", force: :cascade do |t|
    t.integer  "order_id",    limit: 4,                          null: false
    t.integer  "product_id",  limit: 4,                          null: false
    t.integer  "qty",         limit: 4,                          null: false
    t.decimal  "unit_price",            precision: 10, scale: 2, null: false
    t.decimal  "total_price",           precision: 10, scale: 2, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "order_lines", ["order_id"], name: "index_order_lines_on_order_id", using: :btree
  add_index "order_lines", ["product_id"], name: "index_order_lines_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id", limit: 4,                            null: false
    t.string   "order_no",    limit: 255,                          null: false
    t.decimal  "total",                   precision: 10, scale: 2, null: false
    t.integer  "status",      limit: 4,                            null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "order_id",            limit: 4,                            null: false
    t.decimal  "amount",                          precision: 10, scale: 2, null: false
    t.string   "payment_state",       limit: 255,                          null: false
    t.string   "paypal_reference_id", limit: 255
    t.string   "paypal_token",        limit: 255
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

  add_index "payments", ["order_id"], name: "index_payments_on_order_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "description", limit: 255,                          null: false
    t.string   "name",        limit: 255,                          null: false
    t.decimal  "price",                   precision: 10, scale: 2, null: false
    t.boolean  "status",                                           null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_foreign_key "order_lines", "orders"
  add_foreign_key "order_lines", "products"
  add_foreign_key "orders", "customers"
  add_foreign_key "payments", "orders"
end
