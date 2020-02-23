ActiveRecord::Schema.define(version: 2020_02_19_144150) do

  create_table "bukkens", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "address"
    t.integer "year"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string "line"
    t.string "station_name"
    t.integer "walk_time"
    t.integer "bukken_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bukken_id"], name: "index_stations_on_bukken_id"
  end

end
