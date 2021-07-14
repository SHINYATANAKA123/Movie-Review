class SearchesController < ApplicationController

  def search
     @movies = Tmdb::Search.movie(params[:word])
  end

end
