class TeachersController < ApplicationController
  def index
    @pagy, @teachers = pagy(User.all.where(is_teacher: true), items: 5)
  end

  def show
    @teacher = User.find(params[:id])
  end

  def search_teachers
    if params[:search].blank?
      redirect_to teachers_path and return
    else
      @parameter = params[:search].downcase
      @results = User.all.where("lower(name) LIKE :search", search: "%#{@parameter}%").where(is_teacher: true)
    end
  end
end
