class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
      @user = User.find_by(id: params[:id])
      @reviews = @user.reviews.page(params[:page]).reverse_order
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

  private

  def user_params
      params.require(:user).permit(:name, :image_id, :email, :birthday, :sex, :intro)
  end

end
