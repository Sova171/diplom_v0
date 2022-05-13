class TeachersController < ApplicationController
  def index
    @teachers = User.all.where(is_teacher: true)
  end

  def show
    @teacher = User.find(params[:id])
  end
end
