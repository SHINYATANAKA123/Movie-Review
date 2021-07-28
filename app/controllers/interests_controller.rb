class InterestsController < ApplicationController


  def create
    a = Tmdb::Movie.detail(params[:movie_id])
    @interest = Interest.new(title: a['title'], poster_path: a['poster_path'], movie_id: a['id'], user_id: current_user.id)
    if @interest.save
      redirect_to request.referer, notice: "観たいリストに追加しました"
    end
  end

  def destroy
    @interest = Interest.find_by(movie_id: params[:movie_id], user_id: current_user.id)
    @interest.destroy
    redirect_to request.referer, notice: "観たいリストから削除しました"
  end




end
