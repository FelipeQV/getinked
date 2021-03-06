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

ActiveRecord::Schema.define(version: 20170629133725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "artist_id"
    t.string   "start_time"
    t.string   "end_time"
    t.string   "photo"
    t.text     "message"
    t.integer  "price_cents", default: 0, null: false
    t.string   "sku"
    t.index ["artist_id"], name: "index_appointments_on_artist_id", using: :btree
    t.index ["user_id"], name: "index_appointments_on_user_id", using: :btree
  end

  create_table "artist_styles", force: :cascade do |t|
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "style_id"
    t.index ["artist_id"], name: "index_artist_styles_on_artist_id", using: :btree
    t.index ["style_id"], name: "index_artist_styles_on_style_id", using: :btree
  end

  create_table "artists", force: :cascade do |t|
    t.string   "info"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.integer  "start_fee"
    t.string   "schedule"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "token_expiry"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "avatar"
    t.integer  "rating"
    t.index ["email"], name: "index_artists_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_artists_on_reset_password_token", unique: true, using: :btree
  end

  create_table "availabilities", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "day"
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_availabilities_on_artist_id", using: :btree
  end

  create_table "chatrooms", force: :cascade do |t|
    t.integer  "appointment_id"
    t.integer  "user_id"
    t.integer  "artist_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["appointment_id"], name: "index_chatrooms_on_appointment_id", using: :btree
    t.index ["artist_id"], name: "index_chatrooms_on_artist_id", using: :btree
    t.index ["user_id"], name: "index_chatrooms_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "artist_id"
    t.string   "from"
    t.integer  "chatroom_id"
    t.index ["artist_id"], name: "index_messages_on_artist_id", using: :btree
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "state"
    t.string   "appointment_sku"
    t.integer  "amount_cents",    default: 0, null: false
    t.json     "payment"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "id_appointment"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "artist_id"
    t.index ["artist_id"], name: "index_photos_on_artist_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "description"
    t.integer  "rating"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "artist_id"
    t.integer  "appointment_id"
    t.index ["appointment_id"], name: "index_reviews_on_appointment_id", using: :btree
    t.index ["artist_id"], name: "index_reviews_on_artist_id", using: :btree
  end

  create_table "styles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "appointments", "artists"
  add_foreign_key "appointments", "users"
  add_foreign_key "artist_styles", "artists"
  add_foreign_key "artist_styles", "styles"
  add_foreign_key "availabilities", "artists"
  add_foreign_key "chatrooms", "appointments"
  add_foreign_key "chatrooms", "artists"
  add_foreign_key "chatrooms", "users"
  add_foreign_key "messages", "artists"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "photos", "artists"
  add_foreign_key "reviews", "appointments"
  add_foreign_key "reviews", "artists"
end
