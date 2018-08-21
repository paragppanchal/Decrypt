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

ActiveRecord::Schema.define(version: 2018_08_21_041733) do

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

  create_table "exchange_coins", force: :cascade do |t|
    t.bigint "exchange_id"
    t.bigint "coin_id"
    t.integer "live_price"
    t.datetime "last_updated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coin_id"], name: "index_exchange_coins_on_coin_id"
    t.index ["exchange_id"], name: "index_exchange_coins_on_exchange_id"
  end

  create_table "exchanges", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.integer "verification_time"
    t.string "fee_description"
    t.string "fee"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "payout_methods"
    t.json "paymnt_methods"
    t.json "available_in_au"
    t.json "beginner_friendly"
    t.json "integrated_wallet"
    t.json "two_factor_auth"
    t.json "cold_storage"
    t.json "multisig_wallets"
  end

  create_table "learnings", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "exchange_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["exchange_id"], name: "index_reviews_on_exchange_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.json "subscribe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "exchange_coins", "coins"
  add_foreign_key "exchange_coins", "exchanges"
  add_foreign_key "reviews", "exchanges"
  add_foreign_key "reviews", "users"
end
