# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
f1 = Film.create(title: "A Wonderful Film", description: "A cute film about lots of wonderful stuff.",
url_slug: "a_wonderful_film", year: 1973, related_film_ids: [2, 4, 7], average_rating:[5]);

f2 = Film.create(title: "All About Fandor", description: "Documentary telling the tail of Fandor.",
url_slug: "all_about_fandor", year: 2001, related_film_ids: [1, 4, 7], average_rating:[]);

f2 = Film.create(title: "Dancing with Elephants", description: "The classic tale of Dancing with Wolves, but with elephants!",
url_slug: "dancing_with_elephants", year: 2016, related_film_ids: [], average_rating: []);
