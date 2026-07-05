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
    @follow = current_user.following_relationships.find_by(id: params[:id])

    if @follow
      unfollowed_user = @follow.followed
      @follow.destroy
      redirect_to user_path(unfollowed_user), notice: "You are no longer following this user."
    else
      redirect_to users_path, alert: "Could not complete that action."
    end
  end
end
