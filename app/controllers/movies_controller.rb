class MoviesController < ApplicationController


  def index
    @popular_movie = Tmdb::Movie.popular
    @genres = GENRES
  end



  def show

    @movie = Tmdb::Movie.detail(params[:id])
    @casts = Tmdb::Movie.cast(params[:id])
    @movie_id = params[:id]
    @images = Tmdb::Movie.posters(params[:id])

		@review = Review.new
		@reviews = Review.where(movie_id: params[:id]).page(params[:page]).reverse_order
		@review_count = Review.where(movie_id: params[:id], user_id: current_user.id).count if user_signed_in?
    @user_review = Review.find_by(movie_id: params[:id], user_id: current_user.id)if user_signed_in?

    @interests = Interest.find_by(user_id: current_user.id, movie_id: params[:id])if user_signed_in? # current_userが該当のmovieをお気に入り登録済みか確認するための検索
    @interest_users = Interest.where(movie_id: params[:id]).count if user_signed_in? # 該当のmovieをお気に入りしているuserの数を調べる
  end



end
