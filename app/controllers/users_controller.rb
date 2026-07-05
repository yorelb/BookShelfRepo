class UsersController < ApplicationController
  def index
    @post = Post.new
    # Get all other users and ones we don't follow
    dont_show_users = current_user.following.pluck(:id) << current_user.id
    @users = User.where.not(id: dont_show_users).limit(10)
    @posts = Post.order(created_at: :desc)

  end

  def show
    @user = User.find(params[:id])
  end
end
