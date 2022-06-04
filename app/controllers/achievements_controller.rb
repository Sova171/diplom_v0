class AchievementsController < ApplicationController
  #before_action :set_achievement, only: %i[ show edit update destroy ]

  def create
    @user = User.find(params[:user_id])
    @achievement = @user.achievements.create(achievement_params)
    redirect_to myprofile_path, notice: "Achievement was successfully created."
  end

  def show
    @achievement = Achievement.find(params[:id])
    @comments = @achievement.comments.order(created_at: :desc)
  end

  def destroy
    @achievement = Achievement.find(params[:id])
    result_id = @achievement.user
    user = User.find(result_id.id)
    @achievement.destroy

    if current_user.admin && user.is_teacher
      redirect_to teacher_path(result_id), alert: "Achievement was successfully destroyed."
    elsif current_user.admin && !user.is_teacher
      redirect_to student_path(result_id), alert: "Achievement was successfully destroyed."
    else
      redirect_to myprofile_path, alert: "Achievement was successfully destroyed."
    end

  end

  private
  def achievement_params
    params.require(:achievement).permit(:title, :description)
  end
end
