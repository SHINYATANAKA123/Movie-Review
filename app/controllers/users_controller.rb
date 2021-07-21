class UsersController < ApplicationController


  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).reverse_order
    if @q_header
      @users = @q_header.result(distinct: true)
    end
  end

  def show
      @user = User.find_by(id: params[:id])

      @reviews = @user.reviews.page(params[:page]).reverse_order
      @good_reviews = @user.good_reviews.page(params[:page]).reverse_order
      @bad_reviews = @user.bad_reviews.page(params[:page]).reverse_order

      @user_followings = @user.followings.page(params[:page])
      @user_followers = @user.followers.page(params[:page])
      
      @interests = @user.interests.page(params[:page])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      sleep(3)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました"
    else
      render :edit
    end
  end

  def search
    @q = User.search(search_params)
    @users = @q.result(distinct: true).page(params[:page]).reverse_order
    render :index
  end


  private

  def user_params
      params.require(:user).permit(:name, :image_id, :email, :birthday, :sex, :intro)
  end

  def search_params
    params.require(:q).permit(:name_cont, :intro_cont, :sex_eq, :birthday_gteq, :birthday_lteq, :birthday_to_age_gteq, :birthday_to_age_lteq)
  end

end
