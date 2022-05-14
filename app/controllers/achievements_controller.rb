class AchievementsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @achievement = @user.achievements.create(achievement_params)
    redirect_to user_path(@user)
  end

  def show
    @achievement = Achievement.find(params[:id])
  end

  private
  def achievement_params
    params.require(:achievement).permit(:title, :description)
  end
end
