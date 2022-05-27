class StudentsController < ApplicationController
  def index
    @pagy, @students = pagy(User.all.where(is_teacher: false), items: 5)
  end

  def show
    @student = User.find(params[:id])
  end

  def search
    if params[:search].blank?
      redirect_to root_path and return
    else
      @parameter = params[:search].downcase
      @results = User.all.where("lower(name) LIKE :search", search: "%#{@parameter}%").where(is_teacher: false)
    end
  end
end

