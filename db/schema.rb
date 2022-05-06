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

ActiveRecord::Schema.define(version: 0) do

  create_table "companies", primary_key: "code", id: { type: :string, limit: 6 }, charset: "latin1", force: :cascade do |t|
    t.string "company_name", null: false
    t.string "address", null: false
    t.string "email", null: false
    t.string "phone_number", limit: 10, null: false
    t.string "website"
    t.text "logo", null: false
    t.integer "status"
  end

  create_table "permissions", primary_key: "permission_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.string "permission_name", limit: 100, null: false
  end

  create_table "role_user", primary_key: ["user_id", "role_id"], charset: "latin1", force: :cascade do |t|
    t.integer "user_id", null: false, unsigned: true
    t.integer "role_id", null: false, unsigned: true
    t.index ["role_id"], name: "FK_role"
  end

  create_table "roles", primary_key: "role_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.text "role_name", null: false
    t.text "description", null: false
  end

  create_table "users", primary_key: "user_id", id: { type: :integer, unsigned: true }, charset: "latin1", force: :cascade do |t|
    t.string "first_name", limit: 100
    t.string "last_name", limit: 100
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "phone", limit: 10, null: false
    t.index ["email"], name: "email", unique: true
    t.index ["phone"], name: "phone", unique: true
  end

  add_foreign_key "role_user", "roles", primary_key: "role_id", name: "FK_role"
  add_foreign_key "role_user", "users", primary_key: "user_id", name: "FK_user_role"
end
