class AchievementsController < ApplicationController
  #before_action :set_achievement, only: %i[ show edit update destroy ]

  def create
    @user = User.find(params[:user_id])
    @achievement = @user.achievements.create(achievement_params)
    redirect_to myprofile_path
  end

  def show
    @achievement = Achievement.find(params[:id])
  end

  def destroy
    @achievement = Achievement.find(params[:id])
    @achievement.destroy

     redirect_to myprofile_path, notice: "Achievement was successfully destroyed."
  end

  private
  def achievement_params
    params.require(:achievement).permit(:title, :description)
  end
end
