Rails.application.routes.draw do
  resources :films
   get '/films/name/:title' => 'films#get_by_name'
   get '/films/rating/:id' => 'films#get_average_rating_by_id'
   post '/films/rating/:id/:score' => 'films#rate_a_film_by_id'
end
