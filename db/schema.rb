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

ActiveRecord::Schema.define(:version => 20110530222649) do

  create_table "assignments", :force => true do |t|
    t.string   "state"
    t.string   "cas_id"
    t.integer  "ticket_id"
    t.integer  "receipt_id"
    t.integer  "principal_id"
    t.integer  "collection_type_id"
    t.integer  "product_id"
    t.integer  "group_id"
    t.string   "name"
    t.string   "rut"
    t.string   "digit"
    t.date     "alloc_date"
    t.integer  "capital"
    t.string   "number"
    t.string   "emitter"
    t.string   "ctacte"
    t.date     "expir_date"
    t.integer  "validity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cancellations", :force => true do |t|
    t.text     "message"
    t.text     "description"
    t.boolean  "state",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.boolean  "state",        :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "field_users", :force => true do |t|
    t.string   "rut"
    t.string   "digit"
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

  create_table "parameters", :force => true do |t|
    t.string   "name"
    t.integer  "val_int"
    t.decimal  "val_dec",     :precision => 10, :scale => 0
    t.text     "description"
    t.boolean  "state",                                      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_agreements", :force => true do |t|
    t.integer  "payment_flow_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "state",           :default => true
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

  create_table "payment_flows", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "state",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_forms", :force => true do |t|
    t.string   "name"
    t.boolean  "emitter",     :default => false
    t.boolean  "num_doc",     :default => false
    t.text     "description"
    t.boolean  "state",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_forms_payment_policies", :id => false, :force => true do |t|
    t.integer  "payment_form_id"
    t.integer  "payment_policy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_periods", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "state"
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
    t.string   "state",                  :default => ""
    t.string   "area"
    t.string   "subarea"
    t.integer  "payment_flow_id"
    t.integer  "payment_agreement_id"
    t.integer  "remesa_id"
    t.string   "payment_agreement_name"
    t.datetime "date_r"
    t.integer  "total_pay"
    t.integer  "total_paid"
    t.string   "user_name"
    t.string   "telephone_user"
    t.integer  "group_id"
    t.string   "et_name"
    t.string   "horario"
    t.boolean  "rc"
    t.string   "canc_by"
    t.datetime "canc_date"
    t.text     "canc_mtvo"
    t.string   "rech_by"
    t.text     "rech_mtvo"
    t.datetime "rech_date"
    t.string   "pdf_by"
    t.datetime "pdf_date"
    t.text     "frs_mtvo"
    t.datetime "tsrc_date"
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
    t.string   "formapago1"
    t.string   "formapago2"
    t.string   "formapago3"
    t.string   "formapago4"
    t.string   "formapago5"
    t.string   "formapago6"
    t.string   "formapago7"
    t.string   "formapago8"
    t.string   "formapago9"
    t.string   "formapago10"
    t.string   "formapago11"
    t.string   "formapago12"
    t.string   "formapago13"
    t.string   "formapago14"
    t.string   "formapago15"
    t.string   "formapago16"
    t.string   "formapago17"
    t.string   "formapago18"
    t.string   "emisor1"
    t.string   "emisor2"
    t.string   "emisor3"
    t.string   "emisor4"
    t.string   "emisor5"
    t.string   "emisor6"
    t.string   "emisor7"
    t.string   "emisor8"
    t.string   "emisor9"
    t.string   "emisor10"
    t.string   "emisor11"
    t.string   "emisor12"
    t.string   "emisor13"
    t.string   "emisor14"
    t.string   "emisor15"
    t.string   "emisor16"
    t.string   "emisor17"
    t.string   "emisor18"
    t.string   "docnum1"
    t.string   "docnum2"
    t.string   "docnum3"
    t.string   "docnum4"
    t.string   "docnum5"
    t.string   "docnum6"
    t.string   "docnum7"
    t.string   "docnum8"
    t.string   "docnum9"
    t.string   "docnum10"
    t.string   "docnum11"
    t.string   "docnum12"
    t.string   "docnum13"
    t.string   "docnum14"
    t.string   "docnum15"
    t.string   "docnum16"
    t.string   "docnum17"
    t.string   "docnum18"
    t.integer  "monto1"
    t.integer  "monto2"
    t.integer  "monto3"
    t.integer  "monto4"
    t.integer  "monto5"
    t.integer  "monto6"
    t.integer  "monto7"
    t.integer  "monto8"
    t.integer  "monto9"
    t.integer  "monto10"
    t.integer  "monto11"
    t.integer  "monto12"
    t.integer  "monto13"
    t.integer  "monto14"
    t.integer  "monto15"
    t.integer  "monto16"
    t.integer  "monto17"
    t.integer  "monto18"
    t.string   "button"
    t.integer  "cancellation_id"
    t.string   "canc_solc_by"
    t.integer  "rejection_type_id"
    t.integer  "principal_id"
    t.integer  "product_id"
    t.integer  "adjust_val"
    t.string   "adjust_ticket"
    t.text     "adjust_obs"
    t.integer  "profile"
  end

  create_table "rejection_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "state",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "area"
  end

  create_table "remesas", :force => true do |t|
    t.string   "state"
    t.integer  "principal_id"
    t.integer  "product_id"
    t.string   "principal_rs"
    t.string   "create_by"
    t.string   "rc_by"
    t.datetime "date_rc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product_name"
    t.text     "test"
  end

  create_table "tickets", :force => true do |t|
    t.integer  "principal_id"
    t.integer  "collection_type_id"
    t.integer  "product_id"
    t.integer  "user_id"
    t.date     "date_pay"
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
    t.integer  "capital",              :default => 0
    t.integer  "arrear_interest",      :default => 0
    t.integer  "term_interest",        :default => 0
    t.integer  "fee",                  :default => 0
    t.integer  "shipping_costs",       :default => 0
    t.integer  "legal_costs",          :default => 0
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
    t.string   "canceled_by"
    t.datetime "canceled_time"
    t.integer  "assignment_id"
    t.integer  "adjust_mx"
    t.boolean  "adjust_sup"
    t.text     "adjust_sup_des"
    t.boolean  "adjust_mgt"
    t.text     "adjust_mgt_des"
    t.datetime "adjust_sup_time"
    t.datetime "adjust_mgt_time"
    t.datetime "adjust_time"
    t.string   "adjust_by"
    t.text     "adjust_obs"
    t.integer  "new_total_pay"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile"
    t.integer  "pay_period_at"
    t.integer  "pay_period_no"
    t.integer  "pay_period_ad"
    t.integer  "ad_capital",           :default => 0
    t.integer  "ad_arrear_interest",   :default => 0
    t.integer  "ad_term_interest",     :default => 0
    t.integer  "ad_fee",               :default => 0
    t.integer  "ad_shipping_costs",    :default => 0
    t.integer  "ad_legal_costs",       :default => 0
    t.integer  "adjust_val",           :default => 0
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
