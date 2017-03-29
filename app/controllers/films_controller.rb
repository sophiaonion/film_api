class FilmsController < ApplicationController
  include ActionController::Helpers
  helper_method :sort_column, :sort_direction
  before_action :set_film, only: [:show, :update, :destroy]

  # GET /films
  # Get all film collections
  # Pagination: Used Kaminari and api_pagination to support the action
  # Filter: models/concerns/filterable, models/film.rb
  def index
    @films = Film.order(sort_column + " " + sort_direction)
    @films = @films.filter(params.slice(:title, :description, :url_slug, :year, :average_rating, :related_film_ids))
    paginate json: @films
  end

  # GET /films/1
  def show
    render json: @film
  end

  # POST /films
  def create
    @film = Film.new(film_params)

    if @film.save
      render json: @film, status: :created, location: @film
    else
      render json: @film.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /films/1
  def update
    if @film.update(film_params)
      render json: @film
    else
      render json: @film.errors, status: :unprocessable_entity
    end
  end

  # DELETE /films/1
  def destroy
    @film.destroy
  end

  #GET /films/name/:title
  def get_by_name #retrieve certain film
    @films = Film.where(title: params[:title])
    render json: @films
  end

  #GET /films/rating/:id
  #Basically we'll retreive the average_rating attribute from db
  #The attribute stores the rating history in an array
  #Then we calculate and return the average rating
  def get_average_rating_by_id
    film = Film.find(params[:id])
    ratings = film["average_rating"]
    sum = ratings.inject{ |sum, el| sum + el }.to_f
    average = sum/ratings.size
    render json: average
  end

  #POST /films/rating/:id/:score
  def rate_a_film_by_id
    film = Film.find(params[:id])
    arr = film["average_rating"]
    score = params[:score].to_i
    puts score
    arr.push(score)
    #TODO if success return 200 or similar indication
    film.update_attribute(:average_rating, arr)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      @film = Film.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def film_params
      params.require(:film).permit(:title, :description, :url_slug, :year, :related_film_ids, :average_rating)
    end

    def sort_column
      Film.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
