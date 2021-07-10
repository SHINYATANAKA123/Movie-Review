class ReviewsController < ApplicationController
  def index
  end

  def show
    @review = Review.find(params[:id])
    @user = @review.user
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to root_path
    else
      # renderだとパラメータが消えてしまうので、バリデーションメッセージをフラッシュに入れてredirectし、viewで表示させる
      flash[:review_alert] = @review.errors.full_messages.to_s.gsub!(/"/, '').gsub(/\]/, '').gsub(/\[/, '')
      redirect_to request.referer
    end
  end

  def edit
  end

  private

  def review_params
    params.require(:review).permit(:movie_id, :title, :poster_path, :user_id, :total_score, :body)
  end


end
