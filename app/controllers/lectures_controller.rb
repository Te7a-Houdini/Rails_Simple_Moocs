class LecturesController < ApplicationController
  before_action :authenticate_user! , only: [:new,:create,:update,:edit,:clear_spams,:like,:unlike,:spam,:unspam]
  def new

    if current_user.is_instructor

      @lecture = Lecture.new
    else

      redirect_to courses_index_path
    end



  end

  def create
    if !current_user.is_instructor
      redirect_to courses_index_path
    end
    @lecture = Lecture.new(lecture_params)
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
    @lecture = Lecture.find_by(:id => params[:id])

    if @lecture.update_attributes(update_params)
      redirect_to courses_index_path
    else
      render 'edit'
    end
  end

  def edit
    @lecture =Lecture.find_by(:id => params[:id])
    if @lecture.user != current_user

      redirect_to courses_index_path
    end

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


  def download
    my_file = params[:file]
    send_file my_file
  end

  def clear_spams

    lecture =Lecture.find_by(id: params[:lecture_id])
    @votes = lecture.find_votes_for(:vote_scope => 'spam')

    @votes.each do |vote|

      vote.destroy()
    end
    redirect_to controller: 'lectures', action: 'show', lecture_id: params[:lecture_id]

  end

  private
  def lecture_params

    params.require(:lecture).permit(:title,:content,:image,:course_id,:attachement);
  end


  def update_params
    params.require(:lecture).permit(:title,:content,:image,:attachement)
  end
end
