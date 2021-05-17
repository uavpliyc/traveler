class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
    @following_users = current_user.following_user
    @follower_users = current_user.follower_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def follows
    user = User.find(params[:id])
    @users = user.follower.page(params[:page]).reverse_order
  end

  def followers
    user = User.find(params[:id])
    @users = user.followed.page(params[:page]).reverse_order
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
  end

end
