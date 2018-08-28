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

ActiveRecord::Schema.define(version: 2018_08_28_005909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "written_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coins", force: :cascade do |t|
    t.string "name"
    t.string "currency_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exchanges", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "verification_time", null: false
    t.string "fee_description"
    t.string "fees"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "payout_methods"
    t.json "payment_methods"
    t.json "available_in_au"
    t.json "beginner_friendly"
    t.json "integrated_wallet"
    t.json "two_factor_auth"
    t.json "cold_storage"
    t.json "multisig_wallets"
    t.string "ease_of_use", default: "", null: false
    t.text "description"
    t.string "url"
  end

  create_table "learnings", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "market_snapshots", force: :cascade do |t|
    t.bigint "exchange_id"
    t.bigint "base_coin_id"
    t.datetime "last_updated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quote_coin_id"
    t.float "buy_price"
    t.float "sell_price"
    t.index ["base_coin_id"], name: "index_market_snapshots_on_base_coin_id"
    t.index ["exchange_id"], name: "index_market_snapshots_on_exchange_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "exchange_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exchange_id"], name: "index_reviews_on_exchange_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "market_snapshots", "coins", column: "base_coin_id"
  add_foreign_key "market_snapshots", "exchanges"
  add_foreign_key "reviews", "exchanges"
end
