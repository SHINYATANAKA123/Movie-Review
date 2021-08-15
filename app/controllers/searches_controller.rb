class SearchesController < ApplicationController
  def search
    @genres = GENRES

    if params[:genre_id].present?
      @genre = @genres.find { |genre| genre[:id] == params[:genre_id].to_i }

      @movie_total_pages = Tmdb::Genre.movies(params[:genre_id]).total_pages
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

      @movies = Tmdb::Genre.movies(params[:genre_id], page: params[:page_id])

    elsif params[:word].present?
      @movie_total_pages = Tmdb::Search.movie(params[:word]).total_pages
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
        @pages = (1..@movie_total_pages).each
      end

      @movies = Tmdb::Search.movie(params[:word], page: params[:page_id])

    else
      redirect_to request.referer, notice: '検索ワードが未入力です'

    end
  end
end
