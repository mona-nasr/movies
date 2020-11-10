# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_10_134109) do

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "actors_movies", id: false, force: :cascade do |t|
    t.integer "actor_id"
    t.integer "movie_id"
    t.index ["actor_id"], name: "index_actors_movies_on_actor_id"
    t.index ["movie_id"], name: "index_actors_movies_on_movie_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries_movies", id: false, force: :cascade do |t|
    t.integer "country_id"
    t.integer "movie_id"
    t.index ["country_id"], name: "index_countries_movies_on_country_id"
    t.index ["movie_id"], name: "index_countries_movies_on_movie_id"
  end

  create_table "filming_locations", force: :cascade do |t|
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "filming_locations_movies", id: false, force: :cascade do |t|
    t.integer "filming_location_id"
    t.integer "movie_id"
    t.index ["filming_location_id"], name: "index_filming_locations_movies_on_filming_location_id"
    t.index ["movie_id"], name: "index_filming_locations_movies_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "movie_title"
    t.text "description"
    t.integer "year"
    t.string "director"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "movie_id"
    t.string "user"
    t.integer "stars"
    t.text "review_text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
