class Movie < ApplicationRecord
  has_and_belongs_to_many :actors
  has_and_belongs_to_many :filming_locations
  has_and_belongs_to_many :countries
  has_many :reviews

  def average_rating
    average = 0

    reviews.each do |review|
      average += review.stars
    end
    average/(reviews.length)
  end
end
