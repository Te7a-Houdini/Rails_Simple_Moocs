class AddDefaultImageToLectures < ActiveRecord::Migration
  def change
    change_column_default :lectures, :image,'default.jpg'
  end
end
