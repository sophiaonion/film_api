class CreateFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :films do |t|
      t.string :title
      t.text :description
      t.string :url_slug
      t.integer :year
      t.text :related_film_ids
      t.text :average_rating

      t.timestamps
    end
  end
end
