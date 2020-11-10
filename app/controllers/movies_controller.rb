class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies.sort{|m| m.average_rating}
  end
end
