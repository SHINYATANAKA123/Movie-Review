class SearchesController < ApplicationController

  def search
     @genres = GENRES

    if params[:genre_id].present?
      @movies = Tmdb::Genre.movies(params[:genre_id])
      @genre = @genres.find{|genre| genre[:id] == params[:genre_id].to_i}
    else
      @movies = Tmdb::Search.movie(params[:word])
    end
  end

end
