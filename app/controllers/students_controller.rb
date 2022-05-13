class StudentsController < ApplicationController
  def index
    @students = User.all.where(is_teacher: false)
  end

  def show
    @student = User.find(params[:id])
  end
end

