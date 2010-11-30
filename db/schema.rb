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

ActiveRecord::Schema.define(:version => 20101130220950) do

  create_table "assignments", :force => true do |t|
    t.string   "state"
    t.string   "cas_id"
    t.integer  "principal_id"
    t.integer  "collection_type_id"
    t.integer  "product_id"
    t.string   "name"
    t.string   "rut"
    t.date     "alloc_date"
    t.integer  "capital"
    t.string   "number"
    t.string   "emitter"
    t.string   "ctacte"
    t.date     "expir_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collection_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "state",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "state",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_agreements", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "state",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_forms", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "state",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_policies", :force => true do |t|
    t.integer  "principal_id"
    t.integer  "product_id"
    t.integer  "collection_type_id"
    t.integer  "arrear_interest"
    t.integer  "term_interest"
    t.integer  "fee"
    t.text     "description"
    t.boolean  "state",              :default => true
    t.boolean  "legal_costs",        :default => false
    t.boolean  "installment",        :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "principals", :force => true do |t|
    t.string   "name"
    t.string   "social_reason"
    t.string   "rut"
    t.string   "digit"
    t.string   "contact"
    t.string   "telephone"
    t.string   "email"
    t.boolean  "state",         :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "state",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "state",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "user"
    t.string   "name"
    t.string   "telephone"
    t.string   "email"
    t.text     "description"
    t.integer  "profile_id"
    t.integer  "group_id"
    t.boolean  "state",              :default => true
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["user"], :name => "index_users_on_user", :unique => true

end
