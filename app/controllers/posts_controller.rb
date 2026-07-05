class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    @posts = Post.order(created_at: :desc)

    excluded_ids = current_user.following.pluck(:id) << current_user.id
    eligible_users = User.where.not(id: excluded_ids)

    if params[:query].present?
      @users = eligible_users.where("email LIKE ?", "%#{params[:query]}%").limit(10)
    else
      @users = eligible_users.limit(5)
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to users_path, notice: "Post published successfully!"
    else
      redirect_to users_path, alert: "Could not publish post."
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])

    if @post
      @post.destroy
      redirect_to users_path, notice: "Post deleted successfully."
    else
      redirect_to users_path, alert: "You cannot delete this post."
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
