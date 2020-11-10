class CreateFilmingLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :filming_locations do |t|
      t.string :location

      t.timestamps
    end

    create_table :filming_locations_movies, id: false do |t|
      t.belongs_to :filming_location
      t.belongs_to :movie
    end
  end
end
