class StudentsController < ApplicationController
  def index
    @users = User.all.where(is_teacher: false)
  end
end

