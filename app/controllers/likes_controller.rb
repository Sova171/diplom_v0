class LikesController < ApplicationController
  before_action :find_achievement
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @achievement.likes.create(user_id: current_user.id)
    end
    redirect_to achievement_path(@achievement)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to achievement_path(@achievement)
  end

  def find_like
    @like = @achievement.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, achievement_id:
      params[:achievement_id]).exists?
  end

  private

  def find_achievement
    @achievement = Achievement.find(params[:achievement_id])
  end
end
