class FilmSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url_slug, :year, :related_film_ids, :average_rating
end
