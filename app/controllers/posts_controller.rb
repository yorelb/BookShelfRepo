class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_path(user_to_follow), notice: "You have successfully posted"
    else
      redirect_to user_path(user_to_follow), alert: "Unable to post at this moment"
    end
  end
end
