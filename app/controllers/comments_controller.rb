class CommentsController < ApplicationController
  before_action :set_achievement
  def create
    @comment = @achievement.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "comment successfully created"
      redirect_to achievement_path(@achievement)
    else
      flash[:notice] = "oops.."
      redirect_to achievement_path(@achievement)
    end
  end

  def destroy
    @comment = @achievement.comments.find(params[:id])
    @comment.destroy
    redirect_to achievement_path(@achievement)
  end

  private
  def set_achievement
    @achievement = Achievement.find(params[:achievement_id])
  end

  def comment_params
    params.require(:comment).permit(:context)
  end
end
