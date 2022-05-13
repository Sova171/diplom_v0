class TeachersController < ApplicationController
  def index
    @users = User.all.where(is_teacher: true)
  end
end
