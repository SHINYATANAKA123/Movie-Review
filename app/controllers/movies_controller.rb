class MoviesController < ApplicationController
 

  def index
    @popular_movie = Tmdb::Movie.popular
  end

  def show

    @movie = Tmdb::Movie.detail(params[:id])
    @movie_id = params[:id]
    @images = Tmdb::Movie.posters(params[:id])

		@review = Review.new
		@reviews = Review.where(movie_id: params[:id]).page(params[:page]).reverse_order
  end



end
