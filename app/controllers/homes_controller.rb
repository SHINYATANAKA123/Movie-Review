class HomesController < ApplicationController

  def ranking
    if user_signed_in?
      @good_ranking_reviews = Review.good_ranks
      @bad_ranking_reviews = Review.bad_ranks
      @follower_ranking_users = User.follower_ranks
      @count_ranking_reviews = Review.count_ranks
    end
  end

  def timeline
    if user_signed_in?
      @timeline_reviews = current_user.timeline.page(params[:page]).reverse_order
    end
  end
end
