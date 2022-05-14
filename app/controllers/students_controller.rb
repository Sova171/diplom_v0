class StudentsController < ApplicationController
  def index
    @students = User.all.where(is_teacher: false)
  end

  def show
    @student = User.find(params[:id])
  end

  def search
    if params[:search].blank?
      redirect_to root_path and return
    else
      @parameter = params[:search].downcase
      @results = User.all.where("name LIKE :search", search: "%#{@parameter}%").where(is_teacher: false)
    end
  end
end

