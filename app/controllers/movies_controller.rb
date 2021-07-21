class MoviesController < ApplicationController


  def index
    @popular_movie = Tmdb::Movie.popular

    # 外部APIを叩いて表示する項目と総件数を取得してくるケースを想定
    # APIはpageやoffsetを指定して数十件ずつ取得するような仕様
    @item_total = @popular_movie['item_total'].to_f

    # カレントページはGETパラメーターとして受け取ってくる想定
    @page = params['page'].to_i

    # 1ページあたり30項目を表示するとして、全ページ数を取得
    @all_page = (@item_total / 20).ceil

    # 全ページ数が10以下なら1から全ページ数までを配列にする
    # 全ページ数が10より大きいならカレントページを中心に10ページ分を配列にする
    if @all_page > 10
      first = [1,  @page - 4].max
      first = [first, all_page - 9].min
      last  = [10, @page + 5].max
      last  = [last, @all_page].min
    else
      @pages = [*1..@all_page]
    end

    @genres = GENRES
  end

  def show

    @movie = Tmdb::Movie.detail(params[:id])
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
