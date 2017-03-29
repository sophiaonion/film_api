class Film < ApplicationRecord
  include Filterable
  #serialize array to text
  serialize :related_film_ids, Array
  serialize :average_rating, Array

  scope :title, -> (title) {  where("title like ?", "#{title}%") }
  scope :description, -> (description) {  where("title like ?", "#{title}%") }
  scope :url_slug, -> (url_slug) { where url_slug: url_slug }
  scope :year, -> (year) { where year: year }
  scope :average_rating, -> (average_rating) { where average_rating: average_rating}
  scope :related_film_ids, -> (related_film_ids) { where related_film_ids: related_film_ids}
end
