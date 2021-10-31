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

ActiveRecord::Schema.define(version: 2021_10_31_060434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "sub_company_count", default: 0
    t.integer "employees_count", default: 0
    t.integer "required_employees_count", default: 0
    t.boolean "requirement_satisfied", default: false
    t.string "country"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["depth"], name: "index_companies_on_depth"
    t.index ["lft"], name: "index_companies_on_lft"
    t.index ["parent_id"], name: "index_companies_on_parent_id"
    t.index ["rgt"], name: "index_companies_on_rgt"
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  add_foreign_key "employees", "companies"
end
