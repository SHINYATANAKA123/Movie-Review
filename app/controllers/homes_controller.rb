class HomesController < ApplicationController
  before_action :move_to_signed_in, only: %i[timeline ranking]

  def about; end

  def ranking
    if user_signed_in?
      @good_ranking_reviews = Review.good_ranks
      @bad_ranking_reviews = Review.bad_ranks
      @follower_ranking_users = User.follower_ranks
      @count_ranking_reviews = Review.count_ranks
    end
  end

  def timeline
    @timeline_reviews = current_user.timeline.page(params[:page]).per(10).reverse_order if user_signed_in?
  end

  def new_guest
    user = User.find_or_create_by!(name: 'guestuser', email: 'guest@example.com', birthday: '1960-01-01',
                                   intro: 'ゲストユーザーです。よろしくお願いします。好きな監督はデヴィッド・フィンチャーです。') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def move_to_signed_in
    unless user_signed_in?
      # サインインしていないユーザーはログインページが表示される
      redirect_to '/users/sign_in'
    end
  end
end
