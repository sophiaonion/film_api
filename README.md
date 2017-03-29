# README

To run the application, you simply just need to start rails server.

API End points:                         Functionality                         Controller#Action
GET /films                              Retrieve a list of films              films#index
    (-support pagination e.g. http://localhost:3000/films?per_page=1&page=2 or ?page[size]=1&page[number]=2
     -support sorting and filtering based on all the attributes
     -support filtering)
POST /films                             Add a film                            films#create
GET  /films/:id                         Retrieve a specific film by id        films#show
PATCH/PUT    /films/:id                 Modify a certain film                 films#update
DELETE /films/:id                       Delete a film                         films#destroy
GET /films/name/:title                  Retrieve a specific film by title     films#get_by_name
GET /films/rating/:id                   Retrieve average rating of a film     films#get_average_rating_by_id
POST /films/rating/:id/:score           Rate a film                           films#rate_a_film_by_id

* Future steps:
  -Allowing a user to change a rating that s/he previously provided
  -Validate score so each rating is within the range of 0~10
  -Session
  -Authentication
  -Authorization
  -Deal with bad input film data, e.g. no title, invalid title etc.
  -More refactoring
  -I have some test case, but definitely should create more
  -bug hunting!
  -Support for only retrieving the attributes as listed in the request
  -More documentation

* Problem Description
Being an SVOD service, we have film data that we need to surface through an API. Your challenge is to create a simple API application using Ruby on Rails (or the web development framework of your choice) for retrieving film data and submitting film ratings.

The application should provide the following functionality:

RESTful endpoints for retrieving a list of films or an individual film
Support for allowing a user to rate a specific film
Include average rating for a film as one of its attributes
Requests and responses should follow the JSON API specification
Please see films.json for sample film data. Please provide tests where reasonable.

Support pagination
Support filtering/sorting
Support for only retrieving the attributes as listed in the request
Document the end points (options that can be passed, etc)
Provide all the documentation we'd need to run the application
