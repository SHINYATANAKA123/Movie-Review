class MoviesController < ApplicationController
  require 'themoviedb-api'
  Tmdb::Api.key("05fe299182c31d92180f6f45dafaf8f1")
  Tmdb::Api.language("ja")

  def index
    @popular_movie = Tmdb::Movie.popular
  end

  def show
    @movie = Tmdb::Movie.detail(params[:id])
		@images = Tmdb::Movie.posters(params[:id])
  end

  def pagination
		page = params[:page].nil? ? 1 : params[:page]
		region = params[:id].nil? ? 'us' : params[:region]
		upcoming = Tmdb::Movie.upcoming({page: page, region: region}).results
		render partial: 'movies/movie', collection: upcoming, locals: {movie: upcoming}
	end

end
