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
		@review_count = Review.where(movie_id: params[:id], user_id: current_user.id).count
    @user_review = Review.find_by(movie_id: params[:id], user_id: current_user.id)
  end



end
