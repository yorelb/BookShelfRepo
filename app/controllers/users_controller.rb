class UsersController < ApplicationController
  def index
    # Get all other users
    @users = User.where.not(id: current_user&.id)
  end

  def show
    @user = User.find(params[:id])
  end
end
