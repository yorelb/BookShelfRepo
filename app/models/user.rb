class User < ApplicationRecord
  # Who follow A
  has_many :follower_relationships, foreign_key: "followed_id", class_name: "Follow", dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower
  # Who A follows
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Follow", dependent: :destroy
  has_many :following, through: :following_relationships, source: :followed
  # Posts
  has_many :posts, dependent: :destroy

  # Note:
  # To follow someone: current_user.following << other_user
  # To unfollow someone: current_user.following.delete(other_user)
  # To see who a user is following: user.following
  # To see a user's followers: user.followers


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
