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

ActiveRecord::Schema.define(:version => 20110411184244) do

  create_table "assignments", :force => true do |t|
    t.string   "state"
    t.string   "cas_id"
    t.integer  "principal_id"
    t.integer  "collection_type_id"
    t.integer  "product_id"
    t.string   "name"
    t.string   "rut"
    t.string   "digit"
    t.date     "alloc_date"
    t.integer  "capital"
    t.string   "number"
    t.string   "emitter"
    t.string   "ctacte"
    t.date     "expir_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.integer  "ticket_id"
    t.integer  "receipt_id"
  end

  create_table "cargrups", :force => true do |t|
    t.integer  "group_id"
    t.integer  "cartera_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cargrups", ["cartera_id"], :name => "index_cargrups_on_cartera_id"
  add_index "cargrups", ["group_id"], :name => "index_cargrups_on_group_id"

  create_table "carteras", :force => true do |t|
    t.integer  "principal_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "state",        :default => true
  end

  add_index "carteras", ["principal_id"], :name => "index_carteras_on_principal_id"
  add_index "carteras", ["product_id"], :name => "index_carteras_on_product_id"

  create_table "collection_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "state",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comunas", :force => true do |t|
    t.string   "name"
    t.boolean  "state",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emitters", :force => true do |t|
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

  create_table "payment_details", :force => true do |t|
    t.integer  "receipt_id"
    t.string   "payment_form"
    t.string   "emitter"
    t.string   "doc_num"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_forms", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "state",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "emitter",     :default => false
    t.boolean  "num_doc",     :default => false
  end

  create_table "payment_forms_payment_policies", :id => false, :force => true do |t|
    t.integer  "payment_form_id"
    t.integer  "payment_policy_id"
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

  create_table "receipts", :force => true do |t|
    t.string   "state",                  :default => "abierto"
    t.integer  "payment_agreement_id"
    t.integer  "user_id"
    t.integer  "comuna_id"
    t.string   "payment_agreement_name"
    t.date     "date_r"
    t.integer  "total_pay"
    t.integer  "total_paid"
    t.string   "user_name"
    t.string   "telephone_user"
    t.integer  "group_id"
    t.string   "et_name"
    t.string   "horario"
    t.boolean  "rc"
    t.string   "user_print"
    t.date     "date_print"
    t.integer  "num_print"
    t.string   "canc_by"
    t.date     "canc_date"
    t.string   "rech_by"
    t.string   "rech_mtvo"
    t.date     "rech_date"
    t.string   "pdf_by"
    t.date     "pdf_date"
    t.string   "frs_mtvo"
    t.date     "date_tsrc"
    t.string   "cont_name"
    t.string   "cont_rut"
    t.string   "cont_digit"
    t.string   "cont_calle"
    t.string   "cont_num"
    t.string   "cont_depto"
    t.string   "cont_comuna"
    t.string   "cont_ref"
    t.string   "cont_hr"
    t.string   "cont_telf1"
    t.string   "cont_telf2"
    t.string   "cont_telf3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.integer  "principal_id"
    t.integer  "collection_type_id"
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "receipt_id"
    t.string   "state",                :default => "creado"
    t.string   "state_fees",           :default => "sin_facturar"
    t.integer  "group_id"
    t.string   "rut"
    t.string   "digit"
    t.string   "name"
    t.string   "cas_id"
    t.string   "principal_name"
    t.string   "collection_type_name"
    t.text     "payment_description"
    t.integer  "capital"
    t.integer  "arrear_interest"
    t.integer  "term_interest"
    t.integer  "fee"
    t.integer  "shipping_costs"
    t.integer  "legal_costs"
    t.integer  "total_pay"
    t.string   "product_name"
    t.string   "number"
    t.string   "emitter"
    t.string   "ctacte"
    t.date     "expir_date"
    t.string   "ballot"
    t.string   "quota_num"
    t.string   "total_q"
    t.string   "prepared_by"
    t.boolean  "doc_delivery"
    t.boolean  "adjust_sup"
    t.text     "adjust_sup_des"
    t.boolean  "adjust_mgt"
    t.text     "adjust_mgt_des"
    t.string   "canceled_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assignment_id"
    t.datetime "adjust_sup_time"
    t.datetime "adjust_mgt_time"
    t.datetime "canceled_time"
    t.integer  "adjust"
    t.datetime "adjust_time"
    t.string   "adjust_by"
    t.text     "adjust_obs"
    t.integer  "new_total_pay"
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
