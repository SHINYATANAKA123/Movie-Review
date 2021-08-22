class ReviewsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit]

  def index
    @reviews = Review.all.page(params[:page]).per(10).reverse_order
  end

  def show
    @review = Review.find(params[:id])
    @user = @review.user
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    review_count = Review.where(movie_id: @review.movie_id, user_id: current_user.id).count
    if @review.valid?
      if review_count < 1
        @review.save
        redirect_to request.referer, notice: 'レビューを保存しました'

      end
    else
      # renderだとパラメータが消えてしまうので、バリデーションメッセージをフラッシュに入れてredirectし、viewで表示させる
      flash[:review_alert] = @review.errors.full_messages.to_s.gsub!(/"/, '').gsub(/\]/, '').gsub(/\[/, '')
      redirect_to request.referer
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to user_path(current_user), notice: 'レビューを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy
    redirect_to root_path, alert: 'レビューを削除しました'
  end

  def edit
    @review = Review.find_by(id: params[:id])
  end

  private

  def ensure_correct_user
    @review = Review.find(params[:id])
    if @review.user != current_user
      flash[:notice] = 'このページにはアクセスできません'
      redirect_back(fallback_location: user_path(current_user))
    else
      render :edit
    end
  end

  def review_params
    params.require(:review).permit(:movie_id, :title, :poster_path, :user_id, :total_score, :body, :spoiler)
  end
end
