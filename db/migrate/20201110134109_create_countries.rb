class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name

      t.timestamps
    end

    create_table :countries_movies, id: false do |t|
      t.belongs_to :country
      t.belongs_to :movie
    end
  end
end
