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

ActiveRecord::Schema.define(version: 20180429014744) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "prefecture_id"
    t.string   "name"
    t.string   "name_kana"
    t.string   "zipcode"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["name"], name: "index_addresses_on_name"
    t.index ["name_kana"], name: "index_addresses_on_name_kana"
    t.index ["prefecture_id"], name: "index_addresses_on_prefecture_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "url"
    t.text     "group"
    t.text     "career"
    t.text     "message"
    t.boolean  "is_deleted", default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_artists_on_user_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clip_artists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_clip_artists_on_artist_id"
    t.index ["user_id"], name: "index_clip_artists_on_user_id"
  end

  create_table "clip_exhibitions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "exhibition_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["exhibition_id"], name: "index_clip_exhibitions_on_exhibition_id"
    t.index ["user_id"], name: "index_clip_exhibitions_on_user_id"
  end

  create_table "clip_works", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clip_works_on_user_id"
    t.index ["work_id"], name: "index_clip_works_on_work_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exhibitions", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "title"
    t.text     "summary"
    t.string   "place"
    t.string   "term"
    t.string   "entrance_fee"
    t.string   "closed_day"
    t.string   "opneing_hour"
    t.string   "information"
    t.string   "url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["artist_id"], name: "index_exhibitions_on_artist_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer  "exhibition_id"
    t.string   "image_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["exhibition_id"], name: "index_images_on_exhibition_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "work_id"
    t.integer  "cart_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
    t.integer  "order_id"
    t.integer  "price"
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["work_id"], name: "index_line_items_on_work_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",        default: 0
    t.string   "state",          default: "未完了"
    t.integer  "total",          default: 0
    t.integer  "postage",        default: 500
    t.string   "payment_state",  default: "未完了"
    t.string   "shipment_state", default: "未完了"
    t.string   "name"
    t.string   "name_kana"
    t.string   "zipcode"
    t.integer  "prefecture_id"
    t.text     "address"
    t.string   "phone"
    t.string   "email"
    t.string   "payment"
    t.boolean  "is_deleted",     default: false, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["name"], name: "index_orders_on_name"
    t.index ["name_kana"], name: "index_orders_on_name_kana"
    t.index ["prefecture_id"], name: "index_orders_on_prefecture_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string   "name"
    t.integer  "postage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "token"
    t.text     "introduction"
    t.text     "image_id"
    t.boolean  "is_artist",              default: false, null: false
    t.boolean  "is_deleted",             default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.integer  "artist_id",                     null: false
    t.string   "title"
    t.string   "image_id"
    t.integer  "price",                         null: false
    t.string   "creation_date"
    t.string   "edition"
    t.integer  "stock",                         null: false
    t.string   "size"
    t.string   "technique"
    t.text     "comment"
    t.boolean  "is_deleted",    default: false, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["artist_id"], name: "index_works_on_artist_id"
  end

end
