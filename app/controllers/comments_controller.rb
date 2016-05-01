class CommentsController < ApplicationController

  def create

    @comment = Comment.new(:user_id => params[:id],:lecture_id => params[:parent],:content => params[:content])
        @comment.save()

    params[:id] = @comment.id
     params[:parent] = ''
    render :json => params
  end


  def update
    @comment = Comment.find_by(:id => params[:id])
    @comment.update_attributes(:content => params[:content])

    render :json => params
  end

  def destroy
   @ok=  Comment.destroy(params[:id])
   render :json => true
  end

  def index

    @comments = Comment.where(:lecture_id => params[:lecture_id])
    @the_comments= []
    @temp_comment={}
    i=0
    @comments.each do |comment|
      @temp_comment[:id] = comment.id
      @temp_comment[:parent]= ""
      @temp_comment[:created] = comment.created_at
     @temp_comment[:modified]=comment.updated_at
     @temp_comment[:fullname]=comment.user.name
    @temp_comment[:profile_picture_url]=comment.user.avatar.url
    @temp_comment[:content] = comment.content

       if comment.user_id.to_s == params[:user_id].to_s
        @temp_comment['created_by_current_user']=true
      else
        @temp_comment['created_by_current_user']=false
      end

      @the_comments[i] =@temp_comment
      @temp_comment = {}
      i = i+1
    end

    render :json => @the_comments
  end
end

