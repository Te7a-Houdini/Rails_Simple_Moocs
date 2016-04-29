class LecturesController < ApplicationController
  before_action :authenticate_user! , only: [:new,:create,:update,:edit]
  def new
    @lecture = Lecture.new

  end

  def create
    @lecture = Lecture.new(require_params)
    @lecture.user_id = current_user.id

    if @lecture.save

      redirect_to courses_index_path
    else
      @lecture.errors.messages[:course_id]=["Must Be Created First !!!!!!!!!!!!!!!!"]
      render 'new'
    end
  end

  def show

  end

  def update

  end

  def edit

  end

  def destroy

  end

  def show_course_lectures


  end

  private
  def require_params

    params.require(:lecture).permit(:title,:content,:image,:course_id,:attachement);
  end

end
