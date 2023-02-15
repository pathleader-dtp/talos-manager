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

ActiveRecord::Schema[7.0].define(version: 2023_02_14_084313) do
  create_table "configs", force: :cascade do |t|
    t.string "name", null: false
    t.text "config", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_configs_on_name", unique: true
  end

  create_table "servers", force: :cascade do |t|
    t.string "state", default: "pending", null: false
    t.string "public_ip", null: false
    t.string "smbios_uuid", null: false
    t.string "private_ip"
    t.string "hostname"
    t.integer "config_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["config_id"], name: "index_servers_on_config_id"
    t.index ["public_ip"], name: "index_servers_on_public_ip", unique: true
  end

end