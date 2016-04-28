class CoursesController < ApplicationController
  before_action :authenticate_user! , only: [:new,:create]
  def index

  end

  def new
      @course = Course.new

  end

  def create
    @course = Course.new(require_params)

    @course.user_id = current_user.id
    if @course.save

     redirect_to courses_index_path
    else
      render 'new'
    end

  end


private
  def require_params

    params.require(:course).permit(:title,:image);
  end
end
