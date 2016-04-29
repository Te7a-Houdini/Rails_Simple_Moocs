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
    lecture_id = params[:lecture_id]
    @lecture =Lecture.find_by(:id => lecture_id)

    if @lecture.find_votes_for(:vote_scope => 'spam').size >= 2

      render 'spamed_page'

    end

  end

  def update

  end

  def edit

  end

  def destroy

  end

  def show_course_lectures

    course_id = params[:course_id]
    @course_title = Course.find_by(:id => course_id).title
    @lectures = Lecture.where(:course_id => course_id)
  end



  def like
    @lecture = Lecture.find_by(:id => params[:lecture_id])
    current_user.likes @lecture
  end

  def unlike
    @lecture = Lecture.find_by(:id => params[:lecture_id])
    current_user.dislikes @lecture
  end


  def spam
    @lecture = Lecture.find_by(:id => params[:lecture_id])
    current_user.likes @lecture ,:vote_scope => 'spam'
  end

  def unspam
    @lecture = Lecture.find_by(:id => params[:lecture_id])
    current_user.dislikes @lecture ,:vote_scope => 'spam'
  end

  def spamed_page

  end


  private
  def require_params

    params.require(:lecture).permit(:title,:content,:image,:course_id,:attachement);
  end

end
