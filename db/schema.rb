# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_12_104340) do

  create_table "absents", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "child_id"
    t.integer "admin_id"
    t.integer "kind"
    t.date "started_on"
    t.date "finished_on"
    t.string "symptom"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "children", force: :cascade do |t|
    t.integer "group_id"
    t.integer "customer_id"
    t.string "name"
    t.string "kana_name"
    t.date "birthday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contact_contacts", force: :cascade do |t|
    t.integer "customer_contact_id"
    t.integer "admin_contact_id"
    t.date "day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "admin_id"
    t.integer "child_id"
    t.string "weather"
    t.string "staple"
    t.string "main"
    t.string "side"
    t.string "dessert"
    t.integer "staple_quantity"
    t.integer "main_quantity"
    t.integer "side_quantity"
    t.integer "dessert_quantity"
    t.time "nap_started_at"
    t.time "nap_finished_at"
    t.text "comment"
    t.integer "humor"
    t.integer "defecation"
    t.integer "defecation_number"
    t.string "temperture"
    t.time "tempertured_at"
    t.string "dinner"
    t.integer "dinner_quantity"
    t.time "dinner_time"
    t.string "breakfast"
    t.integer "breakfast_quantity"
    t.time "breakfast_time"
    t.time "sleep_started_at"
    t.time "sleep_finished_at"
    t.integer "sleep_degree"
    t.integer "pool"
    t.time "pickuped_at"
    t.string "pickup_person"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
    t.integer "user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "kana_name"
    t.integer "child_id"
    t.string "postal_code"
    t.string "address"
    t.string "phone_number"
    t.integer "game_id"
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "admin_id"
    t.integer "game_id"
    t.integer "contact_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "customer_id"
    t.integer "admin_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "customer_id"
    t.boolean "send_by_admin", default: false, null: false
    t.integer "contact_id"
    t.integer "absent_id"
    t.integer "admin_id", null: false
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["absent_id"], name: "index_notifications_on_absent_id"
    t.index ["admin_id"], name: "index_notifications_on_admin_id"
    t.index ["contact_id"], name: "index_notifications_on_contact_id"
    t.index ["customer_id"], name: "index_notifications_on_customer_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "notifications", "absents"
  add_foreign_key "notifications", "admins"
  add_foreign_key "notifications", "contacts"
  add_foreign_key "notifications", "customers"
end
