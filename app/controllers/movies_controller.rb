class MoviesController < ApplicationController
  def index
    @genres = GENRES

    @movie_total_pages = Tmdb::Movie.popular.total_pages
    @page = params[:page_id].to_i

    @next_page = if params[:page_id].present?
                   @page + 1
                 else
                   @page + 2
                 end

    @prev_page = if params[:page_id].to_i == 1
                   1
                 else
                   @page - 1
                 end

    if @movie_total_pages > 10
      first = [1, @page - 4].max
      @first = [first, @movie_total_pages - 9].min
      last = [10, @page + 5].max
      @last  = [last, @movie_total_pages].min
      @pages = (@first..@last).each
    else
      @pages = [*1..@last]
    end

    @popular_movie = Tmdb::Movie.popular(page: params[:page_id])
  end

  def show
    @movie = Tmdb::Movie.detail(params[:id])
    @movie_id = params[:id]
    @images = Tmdb::Movie.posters(params[:id])

    @review = Review.new
    @reviews = Review.where(movie_id: params[:id]).page(params[:page]).reverse_order
    @review_count = Review.where(movie_id: params[:id], user_id: current_user.id).count if user_signed_in?
    @user_review = Review.find_by(movie_id: params[:id], user_id: current_user.id) if user_signed_in?

    if user_signed_in?
      @interests = Interest.find_by(user_id: current_user.id, movie_id: params[:id])
    end # current_userが該当のmovieをお気に入り登録済みか確認するための検索
    @interest_users = Interest.where(movie_id: params[:id]).count if user_signed_in? # 該当のmovieをお気に入りしているuserの数を調べる
  end
end
