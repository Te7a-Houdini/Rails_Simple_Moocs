class ChangeCourseDefaultImage < ActiveRecord::Migration
  def change

    change_column_default :courses, :image,'default.jpg'
  end
end
