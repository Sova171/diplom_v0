class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def index
    @followers = Relationship.all.where(follower_id: current_user.id)
  end

  def create
    current_user.follow(@user)
    redirect_back(fallback_location:"/")
  end

  def destroy
    current_user.unfollow(@user)
    redirect_back(fallback_location:"/")
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
