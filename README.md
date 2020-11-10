# README

* I realized that I will need various relations when looking at the CSV that were not immediately obvious in order to not have duplicate movies and to actually be able to properly read the data like actors later.

* So I created 3 models: Actors, Filming Locations, and Countries in order to link them in a many to many relationship to the Movies.

* I also assumed that I can use a console script to do the CSV import.

* In it I made sure to use find_or_create_by in order to avoid duplicates since we have duplicate Actors, Filming Locations, and Countries in the CSV.

* To save time, I didn't display all the data available for the movie where it pertains to a related model like actors, one has to pay attention to n+1 queries in this case though.

* You can find the database structure UML diagram in the doc directory.

* Below are the scripts I used to import the CSVs:

//////Movies CSV////////

require 'csv'
csv_text = File.read('movies.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  movie = Movie.where(movie_title: row[0]).first

  if !movie.present?
    movie = Movie.create(movie_title: row[0], description: row[1], year: row[2], director: row[3])
  end

  actor = Actor.find_or_create_by(name: row[4])

  movie.actors << actor

  filming_location = FilmingLocation.find_or_create_by(location: row[5])

  movie.filming_locations << filming_location

  country = Country.find_or_create_by(name: row[6])

  movie.countries << country
end

//////Reviews CSV////////

require 'csv'
csv_text = File.read('reviews.csv')
csv = CSV.parse(csv_text, :headers => true)

csv.each do |row|
  movie_id = Movie.where(movie_title: row[0]).first.id
  Review.create(movie_id: movie_id, user: row[1], stars: row[2], review_text: row[3])
end
