class CoursesController < ApplicationController
  before_action :authenticate_user! , only: [:new,:create]
  def index
    @courses = Course.all()
  end

  def new

     if current_user.is_instructor

      @course = Course.new
     else
       redirect_to courses_index_path
     end

  end

  def create

    if !current_user.is_instructor
          redirect_to courses_index_path
      end

      @course = Course.new(courses_params)

    @course.user_id = current_user.id
    if @course.save

     redirect_to courses_index_path
    else

      render 'new'
    end

  end


private
  def courses_params

    params.require(:course).permit(:title,:image);
  end
end
