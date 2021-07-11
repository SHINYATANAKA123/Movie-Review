class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
     @user = User.find_by(id: params[:id])
      @reviews = @user.reviews.page(params[:page]).reverse_order
  end

  def edit
  end
end
