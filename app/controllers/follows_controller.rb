class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    # Find who we want to follow
    user_to_follow = User.find(params[:followed_id])
    # Follow record
    @follow = current_user.following_relationships.build(followed: user_to_follow)
    # Redirects
    if @follow.save
      redirect_to user_path(user_to_follow), notice: "You are now following this user"
    else
      redirect_to user_path(user_to_follow), alert: "Unable to follow this user"
    end
  end

  def destroy
    # Find and delete record
    @follow = current_user.following_relationships.find_by(followed: params[:id])
    @follow.destroy
    # Redirect
    redirect_to user_path(@follow.followed), notice: "You are no longer following this user"
  end
end
